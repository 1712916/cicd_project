import axios from 'axios';
import { useState } from 'react';

function LoginPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [inValidEmail, setInValidEmail] = useState("");
  const [inValidPassword, setInValidPassword] = useState("");
  const [loginMessage, setLoginMessage] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();
    const emailValid = validateEmail(email);
    if (emailValid !== "")  {
      setInValidEmail(emailValid);
    }

    const passwordValid = validatePassword(password);
    if (passwordValid !== "") {
      setInValidPassword(passwordValid);
    }
    console.log('LOLO ', emailValid === "" && passwordValid === "");
    console.log('emailValid ', emailValid );
    console.log('passwordValid ', passwordValid );


    if (emailValid === "" && passwordValid === "") {
      onLogin();
    }
  }

  const onLogin = async () => {
    const loginFormData = new FormData();
    loginFormData.append("account", email)
    loginFormData.append("password", password)
  
    try {
      // make axios post request
      const response = await axios<Map>({
        method: "post",
        url: "http://localhost:1599/login",
        data: {
          "account": email,
          "password": password,
        },
        headers: { "Content-Type": "application/json" },
      });
      if (response.status == 200) {
            
      } else {
        setInValidPassword(response.data['message']);
      }
    } catch(error) {
      console.log('LLLLL');

      console.log(error)
    }
  
  }

  return (
    <div style = {{display : "flex", alignItems : "center", minHeight: "100vh", minWidth: "100vh", justifyContent : "center", textAlign:"left"}}>
       <form onSubmit={handleSubmit}>
      <div>
        <label>Enter your email:
          <input
            type="text"
            value={email}
            onChange={(e) => {
              setInValidEmail("")
              setEmail(e.target.value)
            }}
          />
        </label>
      </div>
      <MessageText string={inValidEmail}></MessageText>
      <div>
        <label>Enter your password:
          <input
            type="password"
            value={password}
            onChange={(e) => {
              setInValidPassword("")
              setPassword(e.target.value)
            }}
          />
        </label>
      </div>
      <MessageText string={inValidPassword}></MessageText>
      <div>
        <input type="submit" value="Đăng nhập" />
      </div>
      <MessageText string={loginMessage}></MessageText>
    </form>
    </div>
  )
}

function MessageText(props) {
  if (props.string.isEmpty || props.string === "") {
    return <></>;
  }
  return <p style={{ color: "red", fontSize: "x-small"}}>{props.string}</p>;
}

function validateEmail(email) {
  if (email === "") {
    return "Không được để trống";
  }
  // if (!String(email)
  //   .toLowerCase()
  //   .match(
  //     /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  //   )) {
  //   return "Sai cấu trúc email";
  // }
  return "";
}

function validatePassword(password) {
  if (password === "") {
    return "Không được để trống";
  }
  return "";
}

export default LoginPage;