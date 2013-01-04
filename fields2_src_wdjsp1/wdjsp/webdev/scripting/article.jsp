<html>
<body>

Dexter is <%= withArticle("dog") %>.<br>
Horton is <%= withArticle("elephant") %>.<br>

<%! static private char[] vowels = { 'a', 'e', 'i', 'o', 'u',
					 'A', 'E', 'I', 'O', 'U' };
	    private boolean startsWithVowel (String word) {
		char first = word.charAt(0);
		for (int i = 0; i < vowels.length; ++i) {
			if (first == vowels[i]) return true;
		}
		return false;
	    }
	    static private String[] articles = { "a ", "an " };
	    private String withArticle (String noun) {
		if (startsWithVowel(noun)) return articles[1] + noun;
		else return articles[0] + noun;
	    } %>

</body>
</html>
