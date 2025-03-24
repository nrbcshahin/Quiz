import {
  KeyboardArrowDown,
  Home,
  KeyboardArrowRight
} from "@mui/icons-material";
import { Link } from "react-router-dom";

export default function TopMenu() {

  const menus = [{
    menuId: 1,
    menuName: "Dashboard",
    icon: "",
    url: "/",
    menus: [],
  }, {
    menuId: 2,
    menuName: "Question",
    icon: "",
    url: "",
    menus: [{
      menuId: 3,
      menuName: "Question List",
      icon: "",
      url: "/question/question-list",
      menus: [],
    }],
  }, {
    menuId: 12,
    menuName: "User",
    icon: "",
    url: "",
    menus: [{
      menuId: 13,
      menuName: "User List",
      icon: "",
      url: "#",
      menus: [],
    }],
  }];


  return (
    <div className="container">
      <ul className="top-menu">
        {
          menus.map((menu) => (
            <li key={menu.menuId} className="dropdown">
              <Link to={menu.url}>
                <Home
                  fontSize="small"
                  sx={{
                    marginRight: 0.5,
                    verticalAlign: "text-top",
                  }}
                />
                {menu.menuName}
                <KeyboardArrowDown
                  fontSize="small"
                  sx={{
                    marginLeft: 0.5,
                    verticalAlign: "sub",
                  }}
                />

              </Link>
              <ul className="sub-menu">
                {
                  menu.menus.map((sub) => (
                    <li key={sub.menuId} className="dropdown">
                      <Link to={sub.url}>
                        <Home
                          fontSize="small"
                          sx={{
                            marginRight: 0.5,
                            verticalAlign: "text-top",
                          }}
                        />
                        {sub.menuName}
                        {sub.menus.length > 0 && (
                          <KeyboardArrowRight
                            fontSize="small"
                            sx={{
                              float: 'right'
                            }}
                          />
                        )}
                      </Link>
                      <ul className="sub-menu">
                        {
                          sub.menus.map(child => (
                            <li key={child.menuId} className="dropdown">
                              <Link to={child.url}>
                                <Home
                                  fontSize="small"
                                  sx={{
                                    marginRight: 0.5,
                                    verticalAlign: "text-top",
                                  }}
                                />
                                {child.menuName}
                              </Link>
                            </li>
                          ))
                        }
                      </ul>
                    </li>
                  ))}
              </ul>
            </li>
          ))
        }
      </ul>
    </div>
  );
}