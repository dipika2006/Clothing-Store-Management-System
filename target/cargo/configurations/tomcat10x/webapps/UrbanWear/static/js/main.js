/* =========================
   MOBILE MENU
========================= */

const menuBtn = document.querySelector(".menu-btn");
const navMenu = document.querySelector(".nav-menu");

if(menuBtn){

    menuBtn.addEventListener("click", () => {

        navMenu.classList.toggle("active");

    });
}

/* =========================
   ACTIVE NAV LINK
========================= */

const currentLocation = window.location.pathname;

const navLinks = document.querySelectorAll(".nav-menu a");

navLinks.forEach(link => {

    if(currentLocation.includes(link.getAttribute("href"))){

        link.classList.add("active");
    }
});

/* =========================
   PRODUCT QUANTITY
========================= */

const minusBtn = document.querySelector(".qty-minus");
const plusBtn = document.querySelector(".qty-plus");
const qtyInput = document.querySelector(".qty-input");

if(minusBtn && plusBtn && qtyInput){

    minusBtn.addEventListener("click", () => {

        let value = parseInt(qtyInput.value);

        if(value > 1){
            qtyInput.value = value - 1;
        }
    });

    plusBtn.addEventListener("click", () => {

        let value = parseInt(qtyInput.value);

        qtyInput.value = value + 1;
    });
}

/* =========================
   AUTO CLOSE MOBILE MENU
========================= */

document.querySelectorAll(".nav-menu a").forEach(link => {

    link.addEventListener("click", () => {

        if(navMenu){
            navMenu.classList.remove("active");
        }
    });
});

/* =========================
   SCROLL HEADER
========================= */

const header = document.querySelector(".header");

window.addEventListener("scroll", () => {

    if(header){

        if(window.scrollY > 40){

            header.classList.add("scrolled");

        }else{

            header.classList.remove("scrolled");
        }
    }
});

/* =========================
   ANIMATION ON SCROLL
========================= */

const revealElements = document.querySelectorAll(
    ".product-card, .dashboard-stat-card, .glass-card, .category-card"
);

const revealOnScroll = () => {

    const triggerBottom = window.innerHeight * 0.9;

    revealElements.forEach(el => {

        const top = el.getBoundingClientRect().top;

        if(top < triggerBottom){

            el.classList.add("show");
        }
    });
};

window.addEventListener("scroll", revealOnScroll);

revealOnScroll();

/* =========================
   DASHBOARD CHART
========================= */

const chartCanvas = document.getElementById("dashboardChart");

if(chartCanvas && typeof Chart !== "undefined"){

    new Chart(chartCanvas, {
        type: "bar",
        data: {
            labels: ["Orders", "Products", "Customers", "Revenue"],
            datasets: [{
                label: "Store Analytics",
                data: [totalOrders, totalProducts, totalUsers, totalRevenue],
                borderWidth: 1
            }]
        },
        options: {
            responsive:true,
            maintainAspectRatio:false,
            plugins:{
                legend:{ display:false }
            },
            scales:{
                y:{ beginAtZero:true }
            }
        }
    });
}

/* =========================
   PRODUCT SIZE SELECT
========================= */

function selectSize(button, size){

    document.querySelectorAll(".size-btn")
        .forEach(btn => btn.classList.remove("active"));

    button.classList.add("active");

    const selectedSize = document.getElementById("selectedSize");

    if(selectedSize){
        selectedSize.value = size;
    }
}

document.addEventListener("DOMContentLoaded", () => {

    const firstBtn = document.querySelector(".size-btn");
    const selectedSize = document.getElementById("selectedSize");

    if(firstBtn && selectedSize){
        firstBtn.classList.add("active");
        selectedSize.value = firstBtn.innerText.trim();
    }

});