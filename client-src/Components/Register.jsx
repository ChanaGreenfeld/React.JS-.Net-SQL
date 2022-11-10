import { useSelector, useDispatch } from "react-redux";
import { LoadData,changCurrentUser } from '../Redux/Users/userAction';
import { GetAllUsers, AddUserServer } from '../Redux/Users/UserServ';
import {useEffect} from 'react'
import {Category} from './Rout/Category'
import { useState } from "react";
import { Link,withRouter } from "react-router-dom"

export default withRouter (function Register( props ){

    var myDis = useDispatch()  
     let users = useSelector((store) => {
        debugger;
        return store.users.usersFromServer
    })
    let current = useSelector((store) => {
        debugger;
        return store.users.current
    })
    var myUsers;

     useEffect(async () => {
       await getFromServer()
     }, [])

    const getFromServer = async () => {
        debugger;
        myUsers = await GetAllUsers()
        myDis(LoadData(myUsers))
        console.log(myUsers)
    }
 
    var tempUsers
    const [flagRegist, setflagRegist] = useState(false);


    const regist = async (e) => {
        
        e.preventDefault();
        
        debugger;
        var temp = {
            id: '',
            name: e.target[0].value,
            password: e.target[1].value,
            mail: e.target[2].value,
            products: []
        }
        tempUsers = await AddUserServer(temp);
        alert("נרשם בהצלחה")
        debugger
        console.log(tempUsers.users)
       let c = { nameC: tempUsers.user.name, products: [], password: tempUsers.user.password }
                  debugger
           
            await myDis(changCurrentUser(c))
            debugger
            setflagRegist(true)
        getFromServer()
    }


    return <>

        <form onSubmit={
            async (e) => await regist(e)
        } >
            <input type="text" placeholder="name" required ></input>
            <input type="password" placeholder="password" required ></input>
            <input type="email" placeholder="email" required ></input>
            <input type="submit" value="submit" />
        </form>

{
    flagRegist && props.history.push({pathname:'/byCategory'}) 
}


    </>




})
// export default Register;