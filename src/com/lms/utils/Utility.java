package com.lms.utils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.sql.DataSource;


public class Utility { //test
	
	static Logger logger = Logger.getLogger(Utility.class.getName());
	
	private static SSLSocketFactory sslSocketFactory;
    private static TrustManager[] trustManager;
    private static SSLContext sslContext;
    private static Properties properties;
    
    static {
    	load();
    }
    
    public static void init() {
    	try{
    		logger.log(Level.INFO,"Inside utility initialization");
    		makeSSLSocketFactory();
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    // Make SSL socket factory - TLS
	public static void makeSSLSocketFactory() throws Exception {
	    if (sslContext == null && getSslSocketFactory() == null) {
	        sslContext = SSLContext.getInstance("TLS");
	        if (trustManager == null) {
	        	trustManager = new TrustManager[]{DummyTrustManager.getInstance()};
	        }
	
	        sslContext.init(new KeyManager[0], trustManager, new SecureRandom());
	    }
	
	    if (getSslSocketFactory() == null) {
	        sslSocketFactory = sslContext.getSocketFactory();
	    }
	}
	
	// Ignore SSL host name verification
	static HostnameVerifier vf = new HostnameVerifier() {
	    public boolean verify(String hostName, SSLSession session) {
	        //logger.warning("WARNING: hostname may not match the certificate host name :" + hostName);
	        return true;
	    }
	};

	public static SSLSocketFactory getSslSocketFactory() {
	    return sslSocketFactory;
	}
	
	public static void setSslSocketFactory(SSLSocketFactory _sslSocketFactory) {
	    sslSocketFactory = _sslSocketFactory;
	}
	
	// HTTP connection
	public static String httpConnect(URL url){
		
		String response = "";
		HttpURLConnection httpCon = null;
		String proxyIp = properties.getProperty("proxy_ip");
		String proxyPort = properties.getProperty("proxy_port");
		logger.log(Level.INFO,"proxyIp ******* : " + proxyIp);
		logger.log(Level.INFO,"proxyPort ******* : " + proxyPort);
		InetSocketAddress proxyInet = new InetSocketAddress(proxyIp,Integer.parseInt(proxyPort));
		Proxy proxy = new Proxy(Proxy.Type.HTTP, proxyInet);
		try {
			httpCon = (HttpURLConnection) url.openConnection(proxy);
			httpCon.setConnectTimeout(25000);
			//httpCon.setDoOutput(true);
			BufferedReader br = 
		   			new BufferedReader(
		   				new InputStreamReader(httpCon.getInputStream()));
		    
		    String temp = "";
		    while ((temp = br.readLine()) != null){
		    	response += temp;
			}
			logger.log(Level.INFO,"response ******* : " + response);
			br.close();
			//httpCon.getOutputStream().close();
		}catch(Exception e){
		    logger.log(Level.WARNING, "Error :", e);
			e.printStackTrace();
		}
		
		return response;
	}
	
	// HTTPS connection
	public static String httpsConnect(URL url){
		
		String response = "";
		HttpsURLConnection httpsCon = null;
		String proxyIp = properties.getProperty("proxy_ip");
		String proxyPort = properties.getProperty("proxy_port");
		logger.log(Level.INFO,"proxyIp ******* : " + proxyIp);
		logger.log(Level.INFO,"proxyPort ******* : " + proxyPort);
		InetSocketAddress proxyInet = new InetSocketAddress(proxyIp,Integer.parseInt(proxyPort));
		Proxy proxy = new Proxy(Proxy.Type.HTTP, proxyInet);
		try {
			//makeSSLSocketFactory();
			
			httpsCon = (HttpsURLConnection) url.openConnection();
			
			//httpsCon.setSSLSocketFactory(sslSocketFactory);
			httpsCon.setConnectTimeout(25000);
			//httpsCon.setRequestMethod("POST");
			BufferedReader br = 
		   			new BufferedReader(
		   				new InputStreamReader(httpsCon.getInputStream()));
		    
		    String temp = "";
		    while ((temp = br.readLine()) != null){
		    	response += temp;
			}
			logger.log(Level.INFO,"response ******* : " + response);
			br.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return response;
	}
	
	// Generate 16 digit unique reference number.
	public static String generateUniqueReferenceNumber(){
		
		String referenceNumber = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssMM");
			Date date = new Date();
			referenceNumber = dateFormat.format(date);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return referenceNumber;
	}
	
	// Get DB connection from JNDI
	public static Connection getDBConnectionFromJndi(){
		
		Connection con = null;
		try {
			Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/lms");
            con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
	
	// Get DB connection from driver
	public static Connection getDBConnection(){
		
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql//127.0.0.1:3306/lms","root","password");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void load() {
		//String path = "c:/config/retail-service.properties";
		String path = "/appserver/retailservice/config/retail-service.properties";
		try {
			properties = new Properties();
			properties.load(new FileInputStream(path));
		} catch(Exception e) {
		    e.printStackTrace();
			return;
		}
		return;
	}
	
	public static Properties getProperties() {
		try{
			if(properties == null) {
				load();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return properties;
	}
	
    public static Date getFirstDayOfMonth() {
        Date beginning = null;
        try {
            Date today = new Date();

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);

            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
            setTimeToBeginningOfDay(calendar);
            beginning = calendar.getTime();
        } catch (Exception e) {
            logger.log(Level.INFO,"Exception :" + e.getMessage());
            e.printStackTrace();
            return null;
        }
        
        return beginning;
    }
    
    public static Date getLastDayOfMonth () {
        Date end = null;
        try {
            Date today = new Date();

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);  
            
            calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            setTimeToEndofDay(calendar);
            end = calendar.getTime();
        } catch (Exception e) {
            logger.log(Level.INFO,"Exception :" + e.getMessage());
            e.printStackTrace();
            return null;
        }
        return end;
    }
    
    public static void setTimeToBeginningOfDay(Calendar calendar) {
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
    }

    public static void setTimeToEndofDay(Calendar calendar) {
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
    }
    
    public static Timestamp getCurrentDayBeginning() {
        Calendar calendar = Calendar.getInstance();
        
        Date date = new Date();
        calendar.setTime(date);
        setTimeToBeginningOfDay(calendar);
        date = calendar.getTime();
        Timestamp beginning = new Timestamp(date.getTime());
        return beginning;
    }
    
    public static Timestamp getCurrentDayEnd() {
        Calendar calendar = Calendar.getInstance();
        
        Date date = new Date();
        calendar.setTime(date);
        setTimeToEndofDay(calendar);
        date = calendar.getTime();
        Timestamp end = new Timestamp(date.getTime());
        return end;
    }
    
    public static long toLong(String str) {
        try {
            return (Long.parseLong(str));
        } catch (Exception e) {
            return 0;
        }
    }
    
    public static int toInt(String str) {
        try {
            return (Integer.parseInt(str));
        } catch (Exception e) {
            return 0;
        }
    }
    
    public static String formatAmount(String amount) {
        try {
            int iLen = amount.length();
            if (iLen == 1) {
                String bal = "00" + amount;
                iLen = bal.length();
                return bal.substring(0, iLen - 2) + "." + bal.substring(iLen - 2);
            } else if (iLen == 2) {
                String bal = "0" + amount;
                iLen = bal.length();
                return bal.substring(0, iLen - 2) + "." + bal.substring(iLen - 2);
            } else {
                return amount.substring(0, iLen - 2) + "." + amount.substring(iLen - 2);
            }
        } catch (Exception e) {
            return "0.00";
        }
    }
    
    public static String formatNumber(String number, String exp) {
        int index = 0;
        StringBuilder masked = new StringBuilder();
        
        try {
            number = number.trim();
            for (int i = 0; i < exp.length(); i++) {
                char c = exp.charAt(i);
                if (c == '#') {
                    masked.append(number.charAt(index));
                    index++;
                } else if (c == 'x' || c == 'X') {
                    masked.append(c);
                    index++;
                } else {
                    masked.append(c);
                }
            }
        } catch (Exception e) {
            return number;
        }
        return masked.toString();
    }
    
    public static String formatAmountWithoutDecimals(String amount) {
        try {
            BigDecimal bg = new BigDecimal(amount);
            BigDecimal bgD = bg.divide(BigDecimal.valueOf(100));
            amount = bgD.toString();
        } catch (Exception e) {
            return amount;
        }
        return amount;
    }
    
}