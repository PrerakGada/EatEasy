const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

var msgData;

exports.offerTrigger = functions.firestore.document(
    'food/{foodId}'
).onCreate((snapshot, context) =>  {
    msgData = snapshot.data();

    var payload = {
        "notification":{
            "title": "From" + msgData.name,
            "body": msgData.description,
            "sound": "default"
        }
        "data": {
            "sendername": msgData.name,
            "message": msgData.description
        }
    }

    return admin.messaging().sendAll(payload, true)
        .then(function(response) {
            //console.log("response:",response);
         })
        .catch((error) => {
            console.log(' +++ Error sending message:', error);
        });
})