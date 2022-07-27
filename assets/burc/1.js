    jaxajax("jax", "/indir.json")
    function jaxajax(isid, urlgir) {
        var ileri, devam, jaxhtml, jax, jaxlist = ""
        var req = new XMLHttpRequest();
        req.overrideMimeType("application/json");
        req.open('GET', urlgir, true);
        req.onload = function () {
            if (req.responseText.length > 2) {
                jax = JSON.parse(req.responseText);
                for (ileri in jax) {
                    jaxhtml = document.getElementById(isid + 'is').innerHTML
                    for (devam in jax[ileri]) {
                        jaxhtml = jaxhtml.replace(new RegExp("{{" + devam + "}}", 'g'), jax[ileri][devam])
                    }
                    jaxlist = jaxlist + jaxhtml
                }
                document.getElementById(isid).innerHTML = jaxlist;
            } else { document.getElementById(isid).innerHTML = ''; }
        };
        req.send(null);
    }