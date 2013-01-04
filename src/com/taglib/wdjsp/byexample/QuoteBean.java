package com.taglib.wdjsp.byexample;

import java.io.*;
import java.util.Vector;
import java.util.Random;

public class QuoteBean {
  private String[] quotes;
  private Random rand;

  public QuoteBean() {
    quotes = new String[1];
    quotes[0] = "Your fortune looks empty!";
    rand = new Random();
  }

  public void setQuoteFile(String path) {
    try {
      File file = new File(path);
      Vector quoteVector = new Vector();
      String quote;

      FileReader stream = new FileReader(file);
      BufferedReader reader = new BufferedReader(stream);
      while ((quote = reader.readLine()) != null)
	quoteVector.add(quote);
      if (quoteVector.size() > 0)
	quotes = (String[])quoteVector.toArray(quotes);
    }
    catch (IOException e) {
      // We'll ignore this
    };
  }

  public String getQuote() {
    return quotes[rand.nextInt(quotes.length)];
  }
}
    
  
