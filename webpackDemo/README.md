Creating a bundle
Create a demo directory to try out webpack. Install webpack.

mkdir webpack-demo && cd webpack-demo
npm init -y
npm install --save-dev webpack

./node_modules/.bin/webpack --help # Shows a list of valid cli commands
.\node_modules\.bin\webpack --help # For windows users
webpack --help # If you installed webpack globally
Now create a subdirectory 'app' with an 'index.js' file.

//app/index.js//
function component () {
  var element = document.createElement('div');

  /* lodash is required for the next line to work */
  element.innerHTML = _.join(['Hello','webpack'], ' ');

  return element;
}

document.body.appendChild(component());


To run this piece of code, create an index.html file in the project's root.

//index.html//
<html>
  <head>
    <title>webpack 2 demo</title>
    <script src="https://unpkg.com/lodash@4.16.6"></script>
  </head>
  <body>
    <script src="app/index.js"></script>
  </body>
</html>

In this example, there are implicit dependencies between the <script> tags.
index.js depends on lodash being included in the page before it runs. It is implicit because index.js never declared a need for lodash; it just assumes that a global variable '_' exists.
There are problems with managing JavaScript projects this way:
If a dependency is missing, or is included in the wrong order, the application will not function at all.
If a dependency is included but is not used, then there is a lot of unnecessary code that the browser has to download.
To bundle the lodash dependency with index.js, we need to first install lodash

npm install --save lodash
and then import it.

//app/index.js//
+ import _ from 'lodash';
function component () {
  ...
}

We also need to change index.html to expect a single bundled js file.
 <html>
   <head>
     <title>webpack 2 demo</title>
-    <script src="https://unpkg.com/lodash@4.16.6"></script>
   </head>
   <body>
-    <script src="app/index.js"></script>
+    <script src="dist/bundle.js"></script>
   </body>
 </html>

Here, index.js explicitly requires lodash to be present, and binds it as _ (no global scope pollution).
By stating what dependencies a module needs, webpack can use this information to build a dependency graph. It then uses the graph to generate an optimized bundle where scripts will be executed in the correct order. Also unused dependencies will not be included in the bundle.

Now run webpack on this folder with index.js as the entry file and bundle.js as the output file in which all code required for the page is bundled.

$ ./node_modules/.bin/webpack app/index.js dist/bundle.js
Hash: ff6c1d39b26f89b3b7bb
Version: webpack 2.2.0
Time: 385ms
    Asset    Size  Chunks                    Chunk Names
bundle.js  544 kB       0  [emitted]  [big]  main
   [0] ./~/lodash/lodash.js 540 kB {0} [built]
   [1] (webpack)/buildin/global.js 509 bytes {0} [built]
   [2] (webpack)/buildin/module.js 517 bytes {0} [built]
   [3] ./app/index.js 278 bytes {0} [built]

note that running $ webpack app/index.js dist/bundle.js wil roduce the same result as the code above.
Output may vary. If the build is successful then you are good to go.
Open index.html in your browser to see the result of a successful bundle. You should see a page with the following text: 'Hello webpack'.