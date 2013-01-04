package com.taglib.wdjsp.databases;

import java.sql.*;
import javax.servlet.http.*;


public class ConnectionBean implements HttpSessionBindingListener {
  private Connection connection;
  private Statement statement;
  
  private static final String driver="postgresql.Driver";
  private static final String dbURL="jdbc:postgresql://slide/test";
  private static final String login="guest";
  private static final String password="guest";

  public ConnectionBean() {
    
    try {
      Class.forName(driver);
      connection=DriverManager.getConnection(dbURL,login,password);
      statement=connection.createStatement();
    }
    catch (ClassNotFoundException e) {
      System.err.println("ConnectionBean: driver unavailable");
      connection = null;
    }
    catch (SQLException e) {
      System.err.println("ConnectionBean: driver not loaded");
      connection = null;
    }
  }

  public Connection getConnection() {
    return connection;
  }

  public void commit() throws SQLException {
    connection.commit();
  }

  public void rollback() throws SQLException {
    connection.rollback();
  }

  public void setAutoCommit(boolean autoCommit)
    throws SQLException {
    connection.setAutoCommit(autoCommit );
  }

  public ResultSet executeQuery(String sql) throws SQLException {
    return statement.executeQuery(sql);
  }

  public int executeUpdate(String sql) throws SQLException {
    return statement.executeUpdate(sql);
  }
  
  public void valueBound(HttpSessionBindingEvent event) {
    System.err.println("ConnectionBean: in the valueBound method");
    try {
      if (connection == null || connection.isClosed()) {
        connection =
          DriverManager.getConnection(dbURL,login,password);
        statement = connection.createStatement();
      }
    }
    catch (SQLException e) { connection = null; }
  }
  
  public void valueUnbound(HttpSessionBindingEvent event) {
    try {
      connection.close();
    }
    catch (SQLException e) { }
    finally {
      connection = null;
    }
  }
  
  protected void finalize() {
    try {
      connection.close();
    }
    catch (SQLException e) { }
  }
}
