namespace :db do
  desc "Fill levels with three level data"
  task :populateLevels => :environment do
    #Rake::Task['db:reset'].invoke
    title = "Why learn HTML?"
    tutorial = "Every webpage you look at is written in a language called HTML. You can think of HTML as the skeleton that gives every webpage structure. In this course, we'll use HTML to add paragraphs, headings, images and links to a webpage. In the editor to the right, there's a tab called test.html. This is the file we'll type our HTML into. See the code with the <>s? That's HTML! Like any language, it has its own special syntax (rules for communicating). When we press Save & Submit Code, the results tab will act like an Internet browser (e.g. Chrome, Firefox, Internet Explorer). A browser's job is to transform the code in test.html into a recognizable webpage! It knows how to lay out the page by following the HTML syntax."
    instruction  = "<ol> <li>To the right, we have a <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code> file. </li>
<li>Change the text on <a href=\"javascript:void(0)\" class=\"line-no\" data-from=\"2\">line 2</a> (the bit between <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">strong</span>&gt;</span></code> and <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"title\">strong</span>&gt;</span></code>) to anything you like!</li>
<li>Hit Save &amp; Submit Code, and you'll see how the <code class=\"ruby\"><span class=\"identifier\"><span class=\"keymethods\">test</span></span>.<span class=\"identifier\">html</span></code> file would look in a browser. Did you see that? The <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">strong</span>&gt;</span><span class=\"tag\">&lt;/<span class=\"title\">strong</span>&gt;</span></code> tags made our text bold!</li>
</ol>"
    number = 1
    answer = "<!DOCTYPE html><strong>Feel free to change this text.</strong>"   
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial)
                    
                    
    title = ""
    tutorial = ""
    instruction  = ""
    number = 2
    answer = ""
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial)
                    
    
    title = "Make the head"
    tutorial = " <p>Everything in our HTML file will go between the opening <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">html</span>&gt;</span></code> and closing <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"title\">html</span>&gt;</span></code> tags.</p>
          <p>There are always two parts to an HTML file: the head and the body. Let's start with the head.</p>
          <p>The head contains information about your HTML file, like its title. The title is what we see in the browser's title bar or page tab. For example the title of this page is \"HTML Basics | Codecademy\".</p>"
    instruction  = "<p>Let's add a head and a title to our webpage.</p>
          <ol>
            <li>Add an opening <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">head</span>&gt;</span></code> tag and closing <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"title\">head</span>&gt;</span></code> tag.</li>
            <li>Between the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">head</span>&gt;</span></code> tags, add in an opening <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">title</span>&gt;</span></code> tag and closing <code class=\"xml\"><span class=\"tag\">&lt;/<span class=\"title\">title</span>&gt;</span></code> tag.</li>
            <li>Between the <code class=\"xml\"><span class=\"tag\">&lt;<span class=\"title\">title</span>&gt;</span></code> tags, write in a title for your page. For example, \"My Webpage.\" </li>
            <li>Press \"Save &amp; Submit Code\" to continue</li>
          </ol>"
    number = 3
    answer = ""
    Level.create!(:instruction => instruction,
                    :number => number,
                    :answer => answer,
                    :title => title,
                    :tutorial => tutorial)                   
  end
end