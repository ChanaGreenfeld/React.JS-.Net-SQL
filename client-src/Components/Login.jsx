import { checkUserServer } from '../Redux/Users/UserServ'
import { useState } from "react";
import  Category  from './Rout/Category'
import { AllUsers } from './AllUsers'
import { useSelector, useDispatch } from "react-redux";
import { changCurrentUser } from '../Redux/Users/userAction'
import { useEffect } from 'react'
import { LoadData ,ChangMan } from '../Redux/Users/userAction';
import { GetAllUsers } from '../Redux/Users/UserServ';
import Register from './Register';
import {withRouter} from 'react-router-dom'


export default withRouter(function Login(props) 
{

    const [flagExsist, setFlagExsist] = useState(false);
    const [flagEnter, setflagEnter] = useState(true);
    const [isMan, setIsMan] = useState(false);
    let use

    useEffect(async() => {
        await getFromServer()

    }, [])


    const getFromServer = async() => {
        debugger;
        let myUsers = await GetAllUsers()
        dis(LoadData(myUsers))
        console.log(myUsers)
    }
    let users = useSelector((store) => {
        debugger;
        return store.users.usersFromServer
    })

    let dis = useDispatch();

    let current = useSelector((store) => {
        debugger;
        console.log(store.users.current.nameC)
        return store.users.current
    })

    const login = async(e) => {

        e.preventDefault();
        debugger;
        setflagEnter(false)
        debugger;
        for (let i = 0; i < users.length; i++) {
            if (users[i].password == e.target[0].value && users[i].mail == e.target[1].value && users[i].man == true)
            {
                                await setIsMan(true)
                                console.log(isMan);
                                dis(ChangMan(users[i]))
                                props.history.push({pathname:'/manager'})
            }
        }
  var c
         if (!isMan) {
             use = {
                mail: e.target[1].value,
                password: e.target[0].value
            }
            debugger
            console.log(use)
            debugger
            let ex = await checkUserServer(use);
          
            debugger;
            if (ex.name === "user not found") {
                
                setFlagExsist(true) 
                props.history.push({pathname:'/Register'})
                // alert("אינך קיים במערכת")
            }
            else
            {
                c = { nameC: ex.name, products: [], password: ex.password }
                debugger
                // dis(ChangMan(c))
                dis(changCurrentUser(c))
                props.history.push({pathname:'/byCategory'})
                debugger
        
            }
           


         }

    }




    
    return <>
    
     {
        flagEnter && <form onSubmit = {async(e) => await login(e)}>
        <input type = "password" placeholder = "password" required></input>
        <input type = "email" placeholder = "email" required></input>
        <input type = "submit" value = "submit"/>
        </form>
    }

    {/* {
        flagExsist && props.history.push({pathname:'/Register'})
      
    }
    {
       !flagExsist && !flagEnter && !isMan && props.history.push({pathname:'/byCategory'})
    }
    {
        isMan && props.history.push({pathname:'/manager'})
    }  */}
    
    
    </>
})