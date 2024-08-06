//remove the comments when you have wired up the API
require("dotenv").config();
const superagent = require("superagent");

//async function to get the posts
getData = async () => {
  let method = "test-endpoint/";
  console.log(`${process.env.STRAPIAPI}${method}`);
  var res = await superagent
    .get(`${process.env.STRAPIAPI}backpage-projects/`)
    .query({});
  //console.log(res.body)
  return res.body;
};

let remoteData = [];
//api call
// if (remoteData.length === 0) remoteData = await getData();
//local data
const testList = [{ name: "wah", title: "gah" }];
//create the api data to pass back
const apiData = {
  testList: testList,
  remoteData: remoteData,
};

module.exports = async () => {
  // Simulate async operation (e.g., fetching from an API)
  return apiData;
};
