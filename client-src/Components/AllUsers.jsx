import { GetAllUsers } from '../Redux/Users/UserServ'
import { LoadData } from "../Redux/Users/userAction";
import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react"

export const AllUsers = () => {

    var myDis = useDispatch()

    let myUsers

    useEffect(async () => {
        debugger;
        myUsers = await GetAllUsers()
        myDis(LoadData(myUsers))
    }, [])

    let users = useSelector((store) => {
        debugger;
        return store.users.usersFromServer
    })
    return <>

        <table>
            <tr>
                <th><b> name</b> </th>
                <th><b> password</b> </th>
                <th><b> mail</b> </th>
            </tr>

            {
                users != undefined &&
                users.length > 0 &&
                users.map((item) =>
                    <>
                        <tr>
                            <td>{item.name}</td>
                            <td>{item.password}</td>
                            <td>{item.mail}</td>
                        </tr>
                    </>
                )}
        </table>
    </>
}