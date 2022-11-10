import  produce  from 'immer';
const UsersInitialState = {
    usersFromServer: [],
    current: { nameC: "", products: [], password: 0 ,endCost:0},
    man:false
}

export const UsersReducer = produce((state, action) => {
    switch (action.type) {
        case "LOAD_DATA":
            {
                state.usersFromServer = action.payload;
                break;
            }
        case "ADD_NEW_USER":
            {
                state.usersFromServer.push(action.payload);
                break;
            }
        case "CHANG_CURRENT_USER":
            {
                debugger
                state.current.nameC = action.payload.nameC
                state.current.password = action.payload.password
                state.current.products = action.payload.products
                state.current.endCost =0
                break;
            }
            case "REMOVE_PRODUCT":
            {
                debugger
                for (let i = 0; i < state.current.products.length; i++) {
                    if(state.current.products[i].id==action.payload)
                    {
                        debugger
                        state.current.endCost=(Number)(state.current.endCost)-Number(((Number)(state.current.products[i].cost)*(Number)(state.current.products[i].amount)))
                        debugger
                        state.current.products.splice(i,1)
                        break;
                    }
                }
                break
            }
            case "ADD_PRODUCT":
            {
                debugger
                var flag=true
                for (let i = 0; i < state.current.products.length; i++) {
                    if(state.current.products[i].id==action.payload.id)
                    {
                        state.current.products[i].amount=(Number)(state.current.products[i].amount)+(Number)(action.payload.amount)
                        if(state.current.products[i].amount==0)
                        {
                            state.current.products.splice(i,1)
                        }
                        flag=false
                    }
                    
                }
                if(flag)
                     state.current.products.push(action.payload)
                state.current.endCost=(Number)(action.payload.cost)+(Number)(state.current.endCost)
            break
            }
            case "CHANG_MAN":
            {
                debugger
                state.man =!state.man
                break;
            }

            case "PAY":
                {
                    state.current.products=[]
                    state.current.nameC=""
                    state.current.password=0
                    state.current.endCost=0
                    break
                }
    }
}, UsersInitialState)