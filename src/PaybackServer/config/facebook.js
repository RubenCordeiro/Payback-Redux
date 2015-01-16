// config/facebook.js
var port = process.env.PORT || 1337;
var url = process.env.URL || "http://localhost:" + port + "/";
module.exports.facebook = {
    clientID: process.env.FB_CLIENT_ID || "279961542177568",
    clientSecret: process.env.FB_CLIENT_SECRET || "72f23d486592a7af12a79c0020457a54"
};
