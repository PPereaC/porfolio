window.onload = function() {
    // Mantener el título después de que Flutter cargue
    const originalTitle = "Mi Porfolio";
    
    // Observar cambios en el título
    const observer = new MutationObserver(function() {
        if (document.title !== originalTitle) {
            document.title = originalTitle;
        }
    });

    observer.observe(document.querySelector('title'), { 
        subtree: true, 
        characterData: true, 
        childList: true 
    });
};