require("dotenv").config();

let todaysDate = new Date();
let _YEAR = todaysDate.getFullYear();

module.exports = {
  YEAR: _YEAR,
  APIURL: process.env.APIURL,
  ADMINURL: process.env.ADMINURL,
};
