document.addEventListener('DOMContentLoaded', function() {
    let tag_name = document.querySelector("#tag_name")
    tag_name.addEventListener('change', function() {
        console.log(tag_name.value)
        tag_name.parentNode.submit();
        
    })
})