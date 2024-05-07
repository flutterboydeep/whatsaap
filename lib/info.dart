const info = [
  {
    'name': 'Bala ji',
    'message': 'Hello, whats up',
    'time': '2:25 pm',
    'profilePic':
        'https://media.istockphoto.com/id/1423855005/photo/hanuman-statue-at-samarth-shrushti-sajjangad-rd-satara-maharashtra-india.webp?b=1&s=170667a&w=0&k=20&c=BQsJMyDYIpr1cdOHInNvY8qbZY25hJTjYd9QmKEybas='
  },
  {
    'name': 'Gujjar ji',
    'message': 'Hey, how are you doing?',
    'time': '3:53 pm',
    'profilePic':
        'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
  },
  {
    'name': 'veer',
    'message': 'Hello, I want to sleep.',
    'time': '1:03 pm',
    'profilePic':
        'https://images.unsplash.com/photo-1609609830354-8f615d61b9c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hpdnxlbnwwfHwwfHx8MA%3D%3D'
  },
  {
    'name': 'Rahul',
    'message': 'Call me, have some work',
    'time': '12:06 pm',
    'profilePic':
        'https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg',
  },
  {
    'name': 'My Billo',
    'message': 'You ate food?',
    'time': '10:00 am',
    'profilePic':
        'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0',
  },
  {
    'name': 'vishal',
    'message': 'Yo!!!!! Long time, no see!?',
    'time': '9:53 am',
    'profilePic':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Abhishek Dera',
    'message': 'Am I fat?',
    'time': '7:25 am',
    'profilePic':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Rajan',
    'message': 'I am from International Olym...',
    'time': '6:02 am',
    'profilePic':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'gulloo',
    'message': 'Lets Code!',
    'time': '4:56 am',
    'profilePic':
        'https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Harsh',
    'message': 'Images by Unsplash',
    'time': '1:00 am',
    'profilePic':
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
];

const messages = [
  {"isMe": false, "text": "Hey What is up with you!!", "time": "10:00 am"},
  {"isMe": true, "text": "im fine,wbu?", "time": "11:00 am"},
  {"isMe": false, "text": "I am great man!", "time": "11:01 am"},
  {
    "isMe": false,
    "text": "Just messaged cuz I had some work.",
    "time": "11:01 am"
  },
  {"isMe": true, "text": "Obviously, say", "time": "11:03 am"},
  {
    "isMe": false,
    "text":
        "Looks great to me!gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
    "time": "11:04 am"
  },
  {
    "isMe": true,
    "text": " Sure, what is the channel name?",
    "time": "11:05 am"
  },
  {
    "isMe": false,
    "text": "Dance With Deep",
    "time": "11:06 am",
  },
  {
    "isMe": true,
    "text":
        "Looks great to me!gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
    "time": "11:15 am",
  },
  {"isMe": false, "text": "Thanks bro!", "time": "11:17 am"},
  {"isMe": false, "text": "Did you subscribe?", "time": "11:16 am"},
  {"isMe": true, "text": "Yes, surely bro!", "time": "11:17 am"},
  {
    "isMe": false,
    "text": "Cool, did you like the Dance?",
    "time": "11:18 am",
  },
  {
    "isMe": true,
    "text": "💕",
    "time": "11:19 am",
  },
  {
    "isMe": false,
    "text": "Tq",
    "time": "11:20 am",
  },
];
