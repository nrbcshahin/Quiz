const AUTH = "AUTH";

const setAuth = (auth) => {
  localStorage.setItem(AUTH, JSON.stringify(auth));
};

const clearAuth = () => {
  localStorage.clear();
};

const getUser = () => {
  var auth = localStorage.getItem(AUTH);
  if (auth == null) {
    return null;
  }
  return JSON.parse(auth).user;
};

const getToken = () => {
  var auth = localStorage.getItem(AUTH);
  if (auth == null) {
    return null;
  }
  return JSON.parse(auth).auth.token;
};

export { setAuth, getUser, getToken, clearAuth };
