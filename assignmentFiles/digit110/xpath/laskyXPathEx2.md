This is a big document, so the Outline view in oXygen might lag for you. Instead, we'll use the XPath window. Looking in the //body of the document, notice how the <div> elements divide it into sections. **Write an XPath expression that returns a view of the <div> elements, and then filters it based on an attribute so you only return the div holding entries on historical persons in the document.**
- //div[@type="Mitford_Team"]

**2b. Find out all the child elements of the div that holds historical persons with XPath: Write an XPath that shows them to you even if you don't know/can't see the element names inside. (Hint: use the wildcard * character.)**
- //div[@type="Mitford_Team"]/child::*
- //div[@type="Mitford_Team"]/*! name() => distinct-values() => sort() /*syntax from class not sure if it exactly works yet but wanted to copy down incase*/


**2c. Switch this up to take a look inside a different <div> of your choice and return its children, whatever they are.**
- //div[@type="places"]/child::*
- //div[@type="place"]/*! name() => distinct-values() => sort /*syntax from class not sure if it exactly works yet but wanted to copy down incase*/

**2c. Okay, now let's take a look at all the possible child elements a <div> could have in this document. Record your XPath expression. The description in oXygen's results window shows you a number of results, but try applying the count() function to your expression to return that number. Hint: You can either wrap the function around the whole expression, or use the XPath arrow operator => to send the results to count().**
- count(//div/child::*)
- //div/*! name() => distinct-values() => sort() = count() /*syntax from class not sure if it exactly works yet but wanted to copy down incase*/
- 20 children

**3a. Find the <list> element that holds all the animal entries. How many entries are inside that list? Record your XPath expression, and once again, try using the count() function to return a number.**
- count(//list[@sortKey="animals"]/item)
- 69 entries

**3b. Okay,remove the count() function so you're returning the full sequence of elements on animals. Look up what the last() function does in our XPath tutorial, and apply it to your XPath: Which animal do you return?**
- //list[@sortKey="animals"]/item[last()]
- Wren Crested

**3c. Getting the hang of this? Write an XPath expression to return the 5th plant in the list of plants. Record your XPath and identify the plant.**
- //list[@sortKey="plants"]/item[5]
- Apple Tree

**3d. Okay, look up the position() function in our XPath tutorial. Notice how you can combine it with comparison operators to test whether nodes are in a position less than, less than or equal to, greater than, etc. a certain number. Following the examples in the tutuorial, write an XPath to return just the first 6 entries in the list of plants.**
- //list[@sortKey="plants"]/item[position() le 6]

The following two XPath expressions return different results. Run each XPath expression, review the results, and explain what you think each expression is returning. **What do you think the parentheses are doing? //person/occupation[1] (//person/occupation)[1]**
- //person/occupation[1] is returning the first instance of the occupation element inside of every person element
- (//person/occupation)[1] is returning the very first instance of the occupation element and no other instances of that element within person
- 
**5a. This set of questions explores how we coded the <person> elements in the file. First, how many <person> elements are in the whole document?**
  - There are 1552 person elements in the whole document
  - count(//person)

**5b. Are all of the <person> elements coded with an @sex attribute? Use a predicate filter with [ ] to find out and record your expression here. How many results do you see?**
- No there are 159 without sex attributes
- //person[not(@sex)]

5c. XPath can work like a calculator: When you return numbers, XPath can handle simple arithmetic operations like add, subtract, multiply (with an *) , and divide (with the word div). With this information:

**Write an XPath expression that returns the count() of person elements coded with @sex attributes, divided by the count() of all the person elements.**
- count(//person[@sex]) div count(//person)
- Result is 0.897551546391752577

**Multiply that by 100 to see a percentage: About what percentage of person elements are coded with @sex attributes in this document?**
- (count(//person[@sex]) div count(//person))*100
- About 89.76% person elements are coded with @sex attributes

**5d. Write an XPath expression to find the number of <person> elements coded as female with @sex="f". Use the count() function and division in XPath once again to find out the proportion of persons coded female among all the persons coded with the @sex attributes.**
- (count(//person[@sex='f']) div count(//person[@sex]))*100
- About 29.72% of person elements are coded female
