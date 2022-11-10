import { LoadData } from "../Redux/Products/ProductsAction";
import { useEffect } from "react"
import { GetAllPrudocts } from '../Redux/Products/ProductsServ';
import { useSelector, useDispatch } from "react-redux";
import { removeP } from '../Redux/Products/ProductsServ'


export const DelP = () => {

    var myDis = useDispatch()

    useEffect(async () => {
        await getProduct()
    }, [])

    const getProduct = async () => {
        debugger
        let myProducts = await GetAllPrudocts()
        myDis(LoadData(myProducts))
    }

    let product = useSelector((store) => {
        debugger;
        return store.prudocts.PrudoctsFromServer
    })


    const removeProductM = async (e) => {
        debugger
        await removeP(e.id)
        await getProduct()
        alert("המוצר נמחק בהצלחה")

    }
    return <>

        {/*<select>

     {
                product != undefined &&
                product.length > 0 &&
                product.map((item) =>
                     <>
                             <option>
                                 
                             <div style={cssPic}>
                     <img src={`/${item.pic}`} width="200px"/>
                         <p>{item.name}</p>
                         <input type="button" value="מחיקת מוצר" style={btn} onClick={async ()=>removeProductM (item)}/>
                     </div>
                     
                             
                         
                             </option>

                     
                         
                    </>
                )
            } 
    </select>*/}
        {
            product != undefined &&
            product.length > 0 &&
            product.map((item) =>
                <>
                    <div >

                        <img src={`/${item.pic}`} width="200px" />
                        <p>שם מוצר: {item.name}</p>
                        {item.amount < 5 ?
                            <p style={notAmount}>כמות במלאי: {item.amount}</p>
                            :
                            <p  >כמות במלאי: {item.amount}</p>
                        }

                        <p>מחיר: {item.cost} ש"ח</p>




                        <input type="button" value="מחיקת מוצר"
                            onClick={async () => removeProductM(item)} />

                    </div>

                </>
            )
        }

    </>
}


const notAmount = {
    color: "red"
}



    // const cc ={
    //     position:"absolute",
    //     top: "50%",
    //     left: "50%",
    //     transform: "translate(-50%, -50%)"
    //   }