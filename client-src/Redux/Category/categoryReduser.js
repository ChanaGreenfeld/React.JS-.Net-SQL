import  produce  from 'immer';
const CategoryInitialState = {
    categoryFromServer: [],
}

export const CategoryReducer = produce((state, action) => {
     switch (action.type) {
        case "LOAD_DATA":
            {
                state.categoryFromServer = action.payload;
                break;
            }
     }
}, CategoryInitialState)