import { useSelector, useDispatch } from "react-redux";
import { addProduct, removeProduct ,pay} from '../Redux/Users/userAction'
import {GetAllPrudocts,updateAmount} from '../Redux/Products/ProductsServ'
import {LoadData} from '../Redux/Products/ProductsAction'
import { payProduct } from "../Redux/Users/UserServ";
import { useEffect } from "react";
export const Bag = () => {

    var dis = useDispatch()
    var myProducts

    useEffect(async() => {
        debugger
              myProducts = await GetAllPrudocts()
              dis(LoadData(myProducts))
    }, [])

    
    let product = useSelector((store) => {
        debugger;
        return store.prudocts.PrudoctsFromServer
    })
   
    


    let bagCurrent = useSelector((store) => {
        debugger;

        return store.users.current
    })

    const addOne = (e) => {
        let p = { id: e.id, nameP: e.name, amount: 1, codeCategory: e.codeCategory, cost: e.cost }
        dis(addProduct(p))
    }

    const lestOne = (e) => {
        let p = { id: e.id, nameP: e.name, amount: -1, codeCategory: e.codeCategory, cost: (Number)(-e.cost) }
        dis(addProduct(p))
    }

    const removeP = (e) => {
        debugger
        dis(removeProduct(e.id))
    }

    const payment =async (prod) => {
        debugger
        let flag=true
        for (let i = 0; i < prod.length; i++) {
            var p = product.find(x => x.id == prod[i].id)
            if (p.amount == 0)
            {
                alert( " אינו במלאי" + prod[i].name +"המוצר")
                flag=false
            }
                
            else 
            {
                if (p.amount < prod[i].amount)
                {
                     alert("אחרונים" + p.amount + " " + p.name + "  יש ממוצר")
                    flag=false
                }
               
            }
                
        }
        if(flag)
        {
            var pr
            for (let i = 0; i < prod.length; i++) {
               
               pr =await updateAmount(prod[i])
               await payProduct(prod[i])
                
               
            }
            dis(LoadData(pr))
            dis(pay(prod)) 
            alert("שלם....")
           
        }
        
    }

    return <>
        {
            bagCurrent != undefined
            && (bagCurrent.products.length > 0
                ?
                <>
                    {
                        bagCurrent.products.map((item) =>
                            <>
                                <div>
                                    <p>{item.nameP} שם</p>
                                    <p>{item.amount} כמות</p>
                                    <p>{item.cost} מחיר</p>
                                    <p>{item.cost * item.amount}  מחיר סופי</p>
                                    <input type="button" value="+" onClick={() => addOne(item)} />
                                    <input type="button" value="-" onClick={() => lestOne(item)} />
                                    <input type="button" value="🗑" onClick={() => removeP(item)} />


                                    <br></br>
                                </div>
                            </>
                        )
                    }
                    <h2>{bagCurrent.endCost}</h2>
                    <input type="button" value="לתשלום" onClick={() => payment(bagCurrent.products)} />

                </>
                :
                <p>אין מוצרים בסל</p>
            )

        }
    </>
}