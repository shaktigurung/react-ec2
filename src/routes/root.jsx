import App from "../App.jsx";
import { Outlet } from "react-router-dom";


export default function Root() {
    return (
      <>
      <App />
      <Outlet />
      </>
    );
  }