import { useEffect } from "react"
import { useSelector, useDispatch } from "react-redux";
import {LoadData} from '../Redux/Category/categoryAction'
import { GetAllCategory ,GetCategoryByName} from '../Redux/Category/categoryServ';
import { addP } from '../Redux/Products/ProductsServ';
// import { LoadData } from '../Redux/Products/ProductsAction';



export const InsertP=()=>{

    let myCategory
    var myDis = useDispatch()

    useEffect(async() => {
        debugger;
        myCategory = await GetAllCategory()
        myDis(LoadData(myCategory))
    }, [])

    let category = useSelector((store) => {
        debugger;
        return store.category.categoryFromServer
    })

    const insP= async (e)=>{
        e.preventDefault();
        debugger
        let code = await GetCategoryByName(e.target[3].value)
        let p={
            id: 0,
            name: e.target[0].value,
            amount: e.target[1].value,
            codeCategory:code[0].id,
            cost:e.target[2].value,
            pic:"cc.jpg"
        }
       //let allP= 
       addP(p)
       alert("המוצר נוסף בהצלחה")
    //    myDis(LoadData(allP))
    }

    return<>
 <form onSubmit = {async(e) =>  insP(e)}>
        <input type = "text" placeholder = "שם מוצר" required></input>
        <input type = "number" placeholder = "כמות מלאי" required></input>
        <input type = "number" placeholder = "מחיר" required></input>
        <select>
                    {
                        category != undefined &&
                        category.length > 0 &&
                        category.map((item) =>
                            <>
                            <option>{item.nameCategory}</option> 
                            </>
                        )
                    }
        </select>
        <input type = "submit" value = "submit"/>
        </form>

    </>



// {
//     
//     "codeCategory":"1",
//     "cost":"1800",
//     "pic":"cc.jpg"
// },
}