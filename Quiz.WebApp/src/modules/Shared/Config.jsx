const dev = {
  apiGateway: {
    URL: "192.168.100.38",
  },
};

const prod = {
  apiGateway: {
    URL: "192.168.30.48:5100",
  },
};

export default process.env.REACT_APP_STAGE === "prod" ? prod : dev;
