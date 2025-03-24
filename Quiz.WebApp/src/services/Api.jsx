import axios, { HttpStatusCode } from "axios";
import { baseUrl } from "../helpers/Constants";
import { getToken } from "./Storage";

const postApi = async (url, data = {}) => {

  return await axios
    .post(baseUrl + url, data, {
      headers: {
        Authorization: "Bearer " + getToken(),
        "Content-Type": "application/json",
      },
    })
    .then((r) => {
      return r.data;
    })
    .catch((error) => {
      const status = error?.response?.status;

      if(status === HttpStatusCode.Unauthorized){
        window.location = '/login';
      }
      
      if (status === undefined) {
        return {
          success: false,
          code: 0,
          message: "Ex : " + error.message,
        };
      }

      return {
        success: false,
        code: error.response.status,
        message: "Ex : " + error.message,
      };
    });
};

export { postApi };
