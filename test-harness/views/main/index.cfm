<cfoutput>
<p>Turn:</p>

<pre><code class="language-sql">#args.uglySQL#</code></pre>

<p>into:</p>

<pre><code class="language-sql">#args.prettySQL#</code></pre>

<p>using:</p>

<pre><code class="language-js">getInstance( "Formatter@SQLFormatter" )
    .format( "SELECT id,fname,lname FROM users where fullName='Michael Born' and age = 'infinite'" );</code></pre>

<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/highlight.min.js" integrity="sha512-yUUc0qWm2rhM7X0EFe82LNnv2moqArj5nro/w1bi05A09hRVeIZbN6jlMoyu0+4I/Bu4Ck/85JQIU82T82M28w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/languages/javascript.min.js" integrity="sha512-V3q3W5043LERycIee7tLy1LAfzxblUrmI5J8p3uZF2FQ3QlMp9QddQoy4OgcIzVs4aCMEj9iwGL5UmjqHF/uBA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/languages/sql.min.js" integrity="sha512-5I+LDIMsGyYrMCqw6hthOUemv4JYGjjVRImZsghX4+SsALaDkU8PFlK1YP7ARi2FX5wwen0dacDLQjVnZsxFyA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.1/styles/default.min.css" integrity="sha512-hasIneQUHlh06VNBe7f6ZcHmeRTLIaQWFd43YriJ0UND19bvYRauxthDg8E4eVNPm9bRUhr5JGeqH7FRFXQu5g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>hljs.highlightAll();</script>
</cfoutput>