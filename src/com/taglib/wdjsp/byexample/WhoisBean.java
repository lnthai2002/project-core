package com.taglib.wdjsp.byexample;

import java.io.*;
import java.net.*;
import java.util.*;

public class WhoisBean {
  private String query;
  private String options;
  private String[] servers;
  private String serverList;


  public WhoisBean() {
    this.query = "";
    this.options = "";
    this.servers = new String[0];
  }

  public void setOptions(String options) {
    this.options = options;
  }

  public String getOptions() {
    return this.options;
  }

  public String getQuery() {
    return query;
  }

  public void setQuery(String query) {
    this.query = query;
  }

  public String getServers(int index) {
    return servers[index];
  }

  public String[] getServers() {
    return servers;
  }

  public void setServers(String server, int index) {
    servers[index] = server;
  }

  public void setServers(String[] servers) {
    this.servers = servers;
  }

  public void setServerList(String values) {
    Vector v = new Vector();
    StringTokenizer tok = new StringTokenizer(values, ",");
    while (tok.hasMoreTokens())
      v.addElement(tok.nextToken());
    servers = new String[v.size()];
    for (int i=0; i < servers.length; i++)
      servers[i] = (String)v.elementAt(i);
  }

  public String getServerList() {
    String values = "";
    for (int i=0; i < servers.length; i++) {
      values += servers[i];
      if (i < (servers.length - 1))
        values += ",";
    }
    return values;
  }

  public String getResults() {
    String queryString;
    if (options.length() > 0)
      queryString = options + " " + query;
    else
      queryString = query;
    String output = "";
    for (int i=0; (i< servers.length) && (query.length()>0); i++) {
      try {
        String line = "";
        Socket connection = new Socket(servers[i], 43);
        InputStream sock = connection.getInputStream();
        PrintStream out =
          new PrintStream(connection.getOutputStream());
        BufferedReader in =
          new BufferedReader(new InputStreamReader(sock));
        output += "Results from " + servers[i] +
          " for \"" + queryString + "\"\n\n";
        out.println(queryString);
        while ((line = in.readLine()) != null)
          output += line + "\n";
      }
      catch(Exception e) {
        output += "Could not contact Whois server at " +
          servers[i] + "\n";
      }
      output += "\n\n\n";
    }
    return output;
  }

  public static void main(String[] args) {
    WhoisBean bean = new WhoisBean();
    bean.setServerList("whois.internic.net");
    bean.setQuery("manning.com");
    System.out.println(bean.getResults());
    bean.setQuery("metafirm.com");
    System.out.println(bean.getResults());
  }
}
