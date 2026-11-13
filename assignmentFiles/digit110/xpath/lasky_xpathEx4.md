1. Write an XPath to find all the @characters attributes on the <cbml:panel> elements and take distinct-values(). Inspect the results. Is this really removing all the duplicates? (Notice how the values are coded.)

>//cbml:panel/@characters => distinct-values()
>No, they are still duplicated because the character values are separated by spaces if you have "#narrator #solin" on one line then it is still a unique combination to have "#narrator #kaliman" on another line leading to a lot of different distinct #narrator combinations. 

2. Let's try the tokenize function to isolate each value. This is one of the "string functions" that needs to look inside each node one at a time, and it needs to be constructed carefully to indicate what it is working on. Tokenize is designed to split values on (by default) spaces, and create a sequence out of them. Let's try it here. Step-by-step:

- To write this, you have to tell tokenize(.) to process just one thing, and usually it's the self node that you navigate to. In this case, that's each @characters attribute.  
- Take your expression from 1. Remove distinct-values().
- At the end of the expression you can use the simple map ! operator to say, work on these nodes one at a time.
- Then add the tokenize(.) function with a dot inside like that. The dot indicates that you're working on the self axis.
- (Unlike the name() function, the string functions like tokenize(.) require the dot notation or a specific node inside the parentheses to process)
- Take a look at your results. THEN, alter your XPath to return the distinct-values. Record the expression. (Better, yes?)

>//cbml:panel/@characters  ! tokenize(.) => distinct-values()
  
3. Let's try out the contains() function. This handy function lets you test nodes to see whether they contain a literal string of characters.

- Look at how contains() is written in The XPath Functions we Use the Most. This function is the first one we've looked at together that takes two arguments.
- I think of this as like "finding a needle in a haystack": Indicate the one place you're searching in position 1, and the 'string-you're-searching-for' in position 2: contains(haystack, needle)
- Usually we put contains() in a predicate filter. You can use the dot . to indicate that you want to search here in a particular node for the string. OR you can step to an element, and write in the attribute you want to check inside the first position of contains()
- 3a. Armed with this information, use the contains() function to try finding all the panels that contain "drkelly" in the @characters value. Record your expression. How many do you find?

>//cbml:panel/@characters[contains(.,"drkelly")]
>5 panels with drkelly included
  
- 3b. Try one other application of contains(), or its cousins starts-with() or ends-with() (your choice of elements or attributes--anything you want to find out from this file), and record your expression and what you find out.

>//cbml:panel/@characters[ends-with(.,"kaliman")] with this expression I was able to find out how many different panels have "kaliman" at the end of the character attribute values. In total I got 9 different panels. 

- Now let's look at the string-length() function. This handy function measures one string at a time. Let's try applying it to the speech balloons in the CBML file to find out who has the longest and shortest speech in this comic.


4. Step down to find all the <cbml:balloon> elements.
- Use the simple map ! operator to take each balloon one at a time, and apply string-length() to it. Record your expression.
  
  >//cbml:balloon ! string-length()
  
- 4a. How long is the longest speech? Record an XPath expression that will give this value. Hint: Use a function we applied in XPath Ex 2.

  >//cbml:balloon ! string-length() => max()
  >The longest speech is 215 characters
  
- 4b. Again applying what you learned from XPath Exercise 2, how will you identify the character who delivers the longest speech? Write an XPath to filter the nodes based on the longest speech and tell you who is speaking.

  >//cbml:balloon[string-length() = //cbml:balloon ! string-length() => max()]/@who
  >The speaker is Kaliman
  
- 4c. Okay, if you go that, change one little thing in your expression so it tells you who delivers the shortest speech in this comic.(Record your XPath expression.) What is the character saying in the shortest speech?

>//cbml:balloon [string-length() = //cbml:balloon ! string-length() => min()]/@who
>Kaliman delivers the shortest speech 

5. Halloween special!
- 5a. Write an XPath that uses predicates and functions to tell you which <cbml:panel> in this comic book contains a <note> that contains the word "skull". Record your expression.

  >//cbml:panel/note[contains(.,"skull")]
  
- 5b. Okay, we have one more thing to tell you about the dot . notation. Sometimes you need to filter your XPath nodes based on something about their deep descendants. When we do this, we need to use the . inside the predicate to indicate that XPath should filter based on the current context. Try these two expressions, and do your best to explain why they return different results: How is the dot notation changing the expression?
 - //div[//cbml:balloon[contains(., 'NO')]]

 - //div[.//cbml:balloon[contains(., 'NO')]]

   (Think about this: Why does the first expression return a different number of results? What do you think the first predicate is doing?)

   >The first expression gives 20 results, it appears to be counting all descendants of the div elements regardless of them containing NO.
   >The second expression gives 10 results, it is actually reading through the children elements and only highlighting the panels that contain a balloon elements with the words NO inside of it.
   >The . in the second expression forced the computer to watch out for what is actually inside of the cbml:balloon. Having no period results in the computer glossing over the formatting as it is not looking for exact content requirements instead it will pull everything that did descend from div.  
