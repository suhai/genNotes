
function generateSuccessHTMLOutput(response) {
  return  '<h4>Result:</h4>' +
          '<h5>Status:</h5>' +
          '<pre>' + response.status + ' ' + response.statusText + '</pre>' +
          '<h5>Headers:</h5>' +
          '<pre>' + JSON.stringify(response.headers, null, '\t') + '</pre>' +
          '<h5>Data:</h5>' +
          '<pre>' + JSON.stringify(response.data, null, '\t') + '</pre>';
}

function generateErrorHTMLOutput(error) {
  return  '<h4>Result:</h4>' +
          '<h5>Message:</h5>' +
          '<pre>' + error.message + '</pre>' +
          '<h5>Status:</h5>' +
          '<pre>' + error.response.status + ' ' + error.response.statusText + '</pre>' +
          '<h5>Headers:</h5>' +
          '<pre>' + JSON.stringify(error.response.headers, null, '\t') + '</pre>' +
          '<h5>Data:</h5>' +
          '<pre>' + JSON.stringify(error.response.data, null, '\t') + '</pre>';
}




function getTodos(){
  var myTodos = document.getElementById('fetchTodos');
  myTodos.innerHTML = '';

  axios.get('http://jsonplaceholder.typicode.com/todos')
    .then(function (response) {
      myTodos.innerHTML = generateSuccessHTMLOutput(response);
    })
    .catch(function (error) {
      myTodos.innerHTML = generateErrorHTMLOutput(error);
    });
}

function clearMyTodos() {
  var myTodos = document.getElementById('fetchTodos');
  myTodos.innerHTML = '';
}


function getTodo(){
  var myTodo = document.getElementById('fetchTodo');
  var todoId = document.getElementById('todoId').value;
  myTodo.innerHTML = '';

  axios.get('http://jsonplaceholder.typicode.com/todos', {
    params: {
      id: todoId
    }
  })
    .then(function (response) {
      myTodo.innerHTML = generateSuccessHTMLOutput(response);
    })
    .catch(function (error) {
      myTodo.innerHTML = generateErrorHTMLOutput(error);
    });
}

function clearMyTodo() {
  var myTodo = document.getElementById('fetchTodo');
  myTodo.innerHTML = '';
}


document.getElementById('todoInputForm').addEventListener('submit', postTodo);
function postTodo(e) {
  var myPostedTodo = document.getElementById('postTodo');
  var todoTitle = document.getElementById('todoTitle').value;
  myPostedTodo.innerHTML = '';

  axios.post('http://jsonplaceholder.typicode.com/todos', {
    userId: '1',
    title: todoTitle,
    completed: false
  })
  .then(function(response) {
    myPostedTodo.innerHTML = generateSuccessHTMLOutput(response);
  })
  .catch(function(error) {
    myPostedTodo.innerHTML = generateErrorHTMLOutput(error);
  })
  e.preventDefault();
}

function clearMyPostedTodo() {
  var myPostedTodo = document.getElementById('postTodo');
  myPostedTodo.innerHTML = '';
}



function clearAll() {
  clearMyTodos();
  clearMyTodo();
  clearMyPostedTodo();
}
