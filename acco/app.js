var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
// const cors = require("cors");
var roomRouter=require('./routes/room');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var logicRouter = require('./routes/logic');

var adminRouter=require('./routes/admin');
var emailRouter=require('./routes/email');
var bookRouter=require('./routes/booking');
var authRouter=require('./routes/authentication');
// var pdfRouter=require('./routes/createpdf');
const router = require('./routes/users');
var genpdfRouter=require('./routes/genpdf');
var invoiceRouter=require('./routes/invoice');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

const { error } = require('console');



const cors = require('cors');
const allowedOrigins = ['http://localhost:4200' ];
const options=cors.CorsOptions= {  origin: allowedOrigins};
app.use(cors(options));
app.use(cors({
  origin: '*'
  
}));

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/invoice',invoiceRouter);
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/booking',bookRouter);
app.use('/logic',logicRouter);
app.use('/genpdf',genpdfRouter);
app.use('/room',roomRouter);
app.use('/email', emailRouter);
// app.use('/createpdf',pdfRouter);
app.use('/admin',adminRouter);
app.use('/authentication',authRouter);
// app.use(express.json());

app.use(function(req, res) {
  return res.status(404).send({ message: 'Route'+req.url+' Not found.' });
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


// app.listen(3001, 'localhost'); // or server.listen(3001, '0.0.0.0'); for all interfaces
// app.on('listening', function() {
//     console.log('Express server started on port %s at %s', server.address().port, server.address().address);
// });


app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  // res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});



module.exports = app;
