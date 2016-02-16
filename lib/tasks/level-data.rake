namespace :db do
  desc "Fill levels with three level data"
  task :populateLevels => :environment do
    #Rake::Task['db:reset'].invoke
    title = "Why learn HTML?"
    tutorial = "<p>Every webpage you look at is written in a language called HTML. You can think of HTML as the skeleton that gives every webpage structure. In this course, we'll use HTML to add paragraphs, headings, images and links to a webpage.</p> <p>In the editor to the right, there's a tab called <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code>. This is the file we'll type our HTML into. See the code with the <code class=\"xml\"><span class=\"tag\">&lt;&gt;</span></code>s? That's HTML! Like any language, it has its own special <strong>syntax</strong> (rules for communicating).</p> <p>When we press Save &amp; Submit Code, the results tab will act like an Internet <strong>browser</strong> (<em>e.g.</em> Chrome, Firefox, Internet Explorer). A browser's job is to transform the code in <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code> into a recognizable webpage! It knows how to lay out the page by following the HTML syntax.</p>"
    instruction  = "<ol><li>To the right, we have a <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code> file. </li><li>Change the text on line 2 (the bit between <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">strong</span>&gt;</span></code> and <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">strong</span>&gt;</span></code>) to anything you like!</li><li>Hit Save &amp; Submit Code, and you'll see how the <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code> file would look in a browser. Did you see that? The <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">strong</span>&gt;</span><span class=\"tag\">&lt;/<span class=\"xmltitle\">strong</span>&gt;</span></code> tags made our text bold!</li></ol>"
    number = 1
    answer = "<!DOCTYPE html><strong>Feel free to change this text.</strong>"   
    defaultCode = "&lt;!DOCTYPE html&gt;
&lt;strong&gt;Feel free to change this text.&lt;/strong&gt;

"
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial,
                    :defaultcode => defaultCode)
                    
                    
    title = "HTML"
    tutorial = "<p>HTML stands for <strong>HyperText Markup Language</strong>.  <strong>Hypertext</strong> means \"text with links in it.\" Any time you click on a word that brings you to a new webpage, you've clicked on hypertext!</p><p>A <strong>markup language</strong> is a programming language used to make text do more than just sit on a page: it can turn text into images, links, tables, lists, and much more. HTML is the markup language we'll be learning.</p><p>What makes webpages pretty? That's CSS—<strong>Cascading Style Sheets</strong>. Think of it like skin and makeup that covers the bones of HTML. We'll learn HTML first, then worry about CSS in later courses.</p><p>The first thing we should do is set up the skeleton of the page.</p><p>a. Always put <code class=\"xml\"><span class=\"doctype\">&lt;!DOCTYPE html&gt;</span></code> on the first line. This tells the browser what language it's reading (in this case, HTML).<br>b. Always put <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code> on the next line. This starts the HTML document.<br>c. Always put <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">html</span>&gt;</span></code> on the last line. This ends the HTML document.</p>"
    instruction  = "<ol><li><p>Go ahead and put the three lines mentioned above into <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code>, which is now blank.</p></li><li><p>In between the second and last line (between the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code> and the <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">html</span>&gt;</span></code>), feel free to write whatever message you like.</p></li></ol>"
    number = 2
    answer = ""
    defaultCode = "&lt;!DOCTYPE html&gt; 
&lt;html&gt; 
HI 
&lt;/html&gt;"
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial,
                    :defaultcode => defaultCode)
                    
    title = "Basic terminology"
    tutorial = "<p>To learn more HTML, we should learn how to talk about HTML. Already you have seen we use <code class=\"xml\"><span class=\"tag\">&lt;&gt;</span></code>s a lot. </p>
<ol>
<li>Things inside <code class=\"xml\"><span class=\"tag\">&lt;&gt;</span></code>s are called <strong>tags</strong>.</li>
<li>Tags nearly always come in pairs: an opening tag and a closing tag.</li>
<li>Example of opening tag: <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code></li>
<li>Example of closing tag: <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">html</span>&gt;</span></code></li>
</ol>
<p>You can think of tags as being like parentheses: whenever you open one, you should close it. Tags also <strong>nest</strong>, so you should close them in the right order: the most recently opened tag should be the first one closed, like in the example below.</p>
<pre><code class=\"xml\"><span class=\"tag\"><span class=\"tag\">&lt;<span class=\"xmltitle\"><span class=\"xmltitle\">first</span></span> <span class=\"attribute\"><span class=\"attribute\">tag</span></span>&gt;</span></span><span class=\"tag\"><span class=\"tag\">&lt;<span class=\"xmltitle\"><span class=\"xmltitle\">second</span></span> <span class=\"attribute\"><span class=\"attribute\">tag</span></span>&gt;</span></span>Some text!<span class=\"tag\"><span class=\"tag\">&lt;/<span class=\"xmltitle\"><span class=\"xmltitle\">second</span></span> <span class=\"attribute\"><span class=\"attribute\">tag</span></span>&gt;</span></span><span class=\"tag\"><span class=\"tag\">&lt;/<span class=\"xmltitle\"><span class=\"xmltitle\">first</span></span> <span class=\"attribute\"><span class=\"attribute\">tag</span></span>&gt;</span></span>
</code></pre>
<p>The last exercise taught us how to set up our HTML file. Everything we do now will go between <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code> and <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">html</span>&gt;</span></code>.</p>
<p>Practice makes perfect! One more time:</p>"
    instruction  = "<ol>
<li>Put in the <code class=\"xml\"><span class=\"doctype\">&lt;!DOCTYPE HTML&gt;</span></code> tag.</li>
<li>Put in the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code> opening and closing tags.</li>
<li>Between the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code> tags, write whatever you like.</li>
<li>Press Save &amp; Submit Code to see what you've written appear on the page!</li>
</ol>"
    number = 3
    answer = ""
    defaultCode = "&lt;!DOCTYPE html&gt; 
&lt;html&gt; 
Hi!
&lt;/html&gt;"
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial,
                    :defaultcode => defaultCode)
                    
    title = "Make the head"
    tutorial = "<p>Everything in our HTML file will go between the opening <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">html</span>&gt;</span></code> and closing <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">html</span>&gt;</span></code> tags.</p><p>There are always two parts to an HTML file: the head and the body. Let's start with the head.</p><p>The head contains information about your HTML file, like its title. The title is what we see in the browser\'s title bar or page tab. For example the title of this page is \"HTML Basics\".</p>"
    instruction  = "<p>Let's add a head and a title to our webpage.</p><ol><li>Add an opening <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">head</span>&gt;</span></code> tag and closing <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">head</span>&gt;</span></code> tag.</li><li>Between the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">head</span>&gt;</span></code> tags, add in an opening <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">title</span>&gt;</span></code> tag and closing <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"xmltitle\">title</span>&gt;</span></code> tag.</li><li>Between the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"xmltitle\">title</span>&gt;</span></code> tags, write in a title for your page. For example, \"My Webpage.\" </li><li>Press \"Save &amp; Submit Code\" to continue</li></ol>"
    number = 4
    answer = ""
    defaultCode = "&lt;!DOCTYPE html&gt; 
&lt;html&gt; 






  
&lt;/html&gt;"
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial,
                    :defaultcode => defaultCode)                   
  end
end