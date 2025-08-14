// Sample request data
let requests = [
    {
        name: "John Doe",
        userId: "101",
        img: "/SPEAK UP/IMAGES/Speak up001/Generic avatar.png",
        time: "2025-08-14T15:30:00"
    },
    {
        name: "Jane Smith",
        userId: "102",
        img: "/SPEAK UP/IMAGES/Speak up001/Generic avatar.png",
        time: "2025-08-14T15:35:00"
    },
    {
        name: "Cartoon User",
        userId: "103",
        img: "/SPEAK UP/IMAGES/Speak up001/Generic avatar.png",
        time: "2025-08-14T15:40:00"
    }
];

// Sort by newest first
requests.sort((a, b) => new Date(b.time) - new Date(a.time));

let container = document.getElementById("requestList");

requests.forEach(req => {
    let card = document.createElement("div");
    card.className = "request-card";
    card.innerHTML = `
        <div><img src="${req.img}" alt="Profile"></div>
        <div><strong>Name -</strong> ${req.name}<br><strong>User ID -</strong> ${req.userId}</div>
        <div>Time - ${new Date(req.time).toLocaleString()}</div>
        <div><button class="button reject">Reject</button></div>
        <div><button class="button allow">Allow</button></div>
        <div><button class="button remove">Remove</button></div>
    `;
    container.appendChild(card);
});
