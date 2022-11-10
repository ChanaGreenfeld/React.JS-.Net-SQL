import { Link } from "react-router-dom"
import { useSelector, useDispatch } from "react-redux";
import  Man  from '../Rout/man';
import './Open.css';
export const Open=()=>{


    // דף הפתיחה
    // לינקים לכניסה , צפיה וסל קניות
    let current = useSelector((store) => {
        //מקבל את הלקוח הנוכחי
        return store.users.current
    })


    let isMan = useSelector((store) => {
        //האם הוא מנהל
        return store.users.man
    })

    return<>
    {
        (current!=undefined && 
        current.nameC!="") && (isMan ?<h2>שלום {current.nameC} 🤵</h2>
        :
        <h2>שלום {current.nameC}</h2>)
    }

    <div className="navbar">
        <div className="d">
        <Link  to="/Login" >כניסה</Link> </div>  
    {
        !isMan &&
        <div className="d">
            <Link  to="/byCategory">צפיה במוצרים</Link>       
            <Link  to="/bag">צפיה בסל הקניות</Link> 
        </div> 
    }
        
    </div>
    </>

}





  