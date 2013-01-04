package com.taglib.wdjsp.byexample;

import java.io.*;
import java.net.*;

public class FingerBean {
  private String server;
  private String query;
  private int port;

  private static final int DEF_PORT = 79;
  private static final String DEF_SERVER = "localhost";

  public FingerBean() {
    this.server = DEF_SERVER;
    this.port = DEF_PORT;
    this.query = "";
  }

  public void setServer(String server) {
    this.server = server;
  }

  public String getServer() {
    return server;
  }

  public String getQuery() {
    return query;
  }

  public void setQuery(String query) {
    this.query = query;
  }

  public String getResults() {
    String results = "";
    InputStream in;
    PrintStream out;
    BufferedReader reader;
    String line;
    StringBuffer strbuf = new StringBuffer();
    try {
      Socket connection = new Socket(server, port);
      out = new PrintStream(connection.getOutputStream());
      out.print(query + "\n");
      in = connection.getInputStream();
      reader = new BufferedReader(new InputStreamReader(in));
      while ((line = reader.readLine()) != null)
	strbuf.append(line + "\n");
      reader.close();
      connection.close();
      results = strbuf.toString();
    }
    catch(Exception e) {
      e.printStackTrace();
      results = "Sorry. An error occurred.";
    }
    return results;
  }

  public static void main(String[] args) {
    FingerBean bean = new FingerBean();
    bean.setQuery("aja");
    System.out.println(bean.getResults());
  }
}
