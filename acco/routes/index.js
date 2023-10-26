var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;



// const corsOptions ={
//     origin:'http://localhost:3001', 
//     credentials:true,            //access-control-allow-credentials:true
//     optionSuccessStatus:200
// }
// app.use(cors(corsOptions));

// app.use(Headers ;
// const corsOpts = {
  
//   origin: '*',

//   methods: [
//     'GET',
//     'POST',
//   ],

//   allowedHeaders: [
//     {'Content-Type':'application/json'}
//   ],
// };

// app.use(cors(corsOpts));
// ALLOW CORS

// const allowedOrigins = ['http://localhost:3001' ];
// const options=cors.CorsOptions= {  origin: allowedOrigins};
// app.use(cors(options));
// app.use(cors({
//   origin: '*'
  
// }));

// app.use(cors({
//   origin: 'http://localhost:4200'
// }));

// app.use(cors());
// // SET CORS for PREFLIGHT OPTIONS
// app.options('*', cors());


// const allowedOrigins = ['http://localhost:3001' ];
// const options=cors.CorsOptions= {  origin: allowedOrigins};
// app.use(cors(options));
// app.use(cors({
//   origin: ['http://localhost:3001','http://localhost:4200']
  
// }));

