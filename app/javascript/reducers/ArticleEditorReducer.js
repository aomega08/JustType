export default (state = { title: '', original_content: '' }, action) => {
  switch (action.type) {
  case 'SET_TITLE':
    return {
      ...state,
      title: action.payload.title
    }
  case 'SET_CONTENT':
    return {
      ...state,
      original_content: action.payload.content
    }
  case 'RECEIVE_ARTICLE':
    return action.payload
  default:
    return state
  }
}
