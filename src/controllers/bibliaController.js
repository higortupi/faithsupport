fetch("https://www.abibliadigital.com.br/api/verses/nvi/jo/16", {
    method: "GET",
    headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJUaHUgTWF5IDA5IDIwMjQgMTU6NTQ6MTEgR01UKzAwMDAubGVvdmFzYzVAaG90bWFpbC5jb20iLCJpYXQiOjE3MTUyNzAwNTF9.UltHF5RJ9JiNlhFQKS_FCH02I6A6zteMtehh8iuJpuA"
    }
})
.then(response => {
    if (!response.ok) {
        throw new Error('Network response was not ok');
    }
    return response.json();
})
.then(data => {
    console.log(data); // Aqui você pode manipular os dados recebidos da API
})
.catch(error => {
    console.error('There has been a problem with your fetch operation:', error);
});
