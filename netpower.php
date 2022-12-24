<?php
if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    return "unrecognized method";
}
include("./config.php");
if ($_POST['req'] == "filter_drive") {
    $$osList = "";
    $apiData = whmcs_getproduct($api_identifier, $api_secret, '155');
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['5']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];
        if ($_POST['selected_platform'] == "80476") {
            $selecttype = "SSD";
        } else if ($_POST['selected_platform'] == "84063") {
            $selecttype = "NVMe";
        }
        $productName = explode(":", $newData['name']);
        if ($productName['0'] == $selecttype) {
            echo '<a class="list_content ssd-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><i data-price="' . $price . '" class="icon-drivessd cp-icons-cs"></i>' . $productName['1'] . '</a>';
        }
    }
}
if ($_POST['req'] == "os_apps_filter") {
    $$osList = "";
    $apiData = whmcs_getproduct($api_identifier, $api_secret, '155');

    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['2']['options']['option'] as $newData) {
        if (strripos($newData['name'], 'windows') !== false) {
            $iconfamily = "windows";
        } elseif (strripos($newData['name'], 'alma') !== false) {
            $iconfamily = "alma";
        } elseif (strpos($newData['name'], 'Ubuntu') !== false) {
            $iconfamily = "ubuntu";
        } elseif (strripos($newData['name'], 'debian') !== false) {
            $iconfamily = "debian";
        } elseif (strripos($newData['name'], 'Rocky') !== false) {
            $iconfamily = "rockylinux";
        } elseif (strripos($newData['name'], 'freebsd') !== false) {
            $iconfamily = "freebsd";
        } elseif (strripos($newData['name'], 'centos') !== false) {
            $iconfamily = "centos";
        } elseif (strripos($newData['name'], 'cloud') !== false) {
            $iconfamily = "cloudlinux";
        } elseif (strripos($newData['name'], 'rancher') !== false) {
            $iconfamily = "rancher";
        } elseif (strripos($newData['name'], 'fedora') !== false) {
            $iconfamily = "fedora";
        } elseif (strripos($newData['name'], 'openbsd') !== false) {
            $iconfamily = "openbsd";
        } elseif (strripos($newData['name'], 'vzlinux') !== false) {
            $iconfamily = "linux";
        } else {
            $iconfamily = "linux";
        }
        $price = $newData['pricing']['USD']['monthly'];
        if ($_POST['selected_platform'] == 'Windows') { {
                if (strripos($newData['name'], 'windows') !== false) {
                    $osList .= '<a class="list_content osapps-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><img data-price="' . $price . '"  src="/en/fonts/cyberpowersvg/os/' . $iconfamily . '.svg" class="op-svg"/>' . $newData['name'] . '</a>';
                }
            }
        } else if ($_POST['selected_platform'] == 'Linux/Unix') {
            if (strpos($newData['name'], 'Windows') === false) {
                $osList .= '<a class="list_content osapps-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><img data-price="' . $price . '"  src="/en/fonts/cyberpowersvg/os/' . $iconfamily . '.svg" class="op-svg"/>' . $newData['name'] . '</a>';
            }
        }
    }


    echo $osList;
}

if ($_POST['req'] == "cps_cpa_os_plans_regions") {
    $apiData = whmcs_getproduct($api_identifier, $api_secret, '155');
    // echo "<pre>";

    // print_r($apiData);
    // die;
    $osList = "";
    $cpu = "";
    $ram = "";
    $regionList = "";
    $cpsList = "";
    $cpaList = "";
    $planList = "";
    $ssd = "";
    $bw = "";
    $storagetype = "";

    // cps


    $additionip = $apiData['products']['product'][0]['configoptions']['configoption']['8']['options']['option'][0]['pricing']['USD']['monthly'];

    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['1']['options']['option'] as $newData) {
        if (strripos($newData['name'], 'virginia') !== false) {
            $region = "us";
        } elseif (strripos($newData['name'], 'cyberpower') !== false) {
            $region = "il";
        }
        $price = $newData['pricing']['USD']['monthly'];
        $regionList .= '<a class="list_content dc-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><img data-price="' . $price . '"  src="/en/img/flags/' . $region . '.svg" class="op-svg"/>' . explode("!", $newData['name'])['0'] . '</a>';
    }



    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['2']['options']['option'] as $newData) {
        if (strripos($newData['name'], 'windows') !== false) {
            $iconfamily = "windows";
        } elseif (strripos($newData['name'], 'alma') !== false) {
            $iconfamily = "alma";
        } elseif (strpos($newData['name'], 'Ubuntu') !== false) {
            $iconfamily = "ubuntu";
        } elseif (strripos($newData['name'], 'debian') !== false) {
            $iconfamily = "debian";
        } elseif (strripos($newData['name'], 'Rocky') !== false) {
            $iconfamily = "rockylinux";
        } elseif (strripos($newData['name'], 'freebsd') !== false) {
            $iconfamily = "freebsd";
        } elseif (strripos($newData['name'], 'centos') !== false) {
            $iconfamily = "centos";
        } elseif (strripos($newData['name'], 'cloud') !== false) {
            $iconfamily = "cloudlinux";
        } elseif (strripos($newData['name'], 'rancher') !== false) {
            $iconfamily = "rancher";
        } elseif (strripos($newData['name'], 'fedora') !== false) {
            $iconfamily = "fedora";
        } elseif (strripos($newData['name'], 'openbsd') !== false) {
            $iconfamily = "openbsd";
        } elseif (strripos($newData['name'], 'vzlinux') !== false) {
            $iconfamily = "linux";
        } else {
            $iconfamily = "linux";
        }
        // $fullname = explode(":",$newData['name']);
        // if ($fullname['0']== 'os-lin'){

        $price = $newData['pricing']['USD']['monthly'];
        // if( $_POST['selected_platform'] == 'Linux/Unix'){
        if (strpos($newData['name'], 'Windows') === false) {
            // $osList .= '<a class="list_content osapps-op" data-price="'.$price.'" rel="'.$newData['id'].'"><img data-price="'.$price.'"  src="./fonts/cyberpowersvg/os/'.$iconfamily.'.svg" class="op-svg"/>'.$newData['name'].'</a>';

            $osList .= '<a class="list_content osapps-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><img data-price="' . $price . '"  src="/en/fonts/cyberpowersvg/os/' . $iconfamily . '.svg" class="op-svg"/>' . $newData['name'] . '</a>';
        }
        // }

    }
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['3']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];

        $ram .= '<a class="list_content ram-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><i data-price="' . $price . '" class="icon-ram cp-icons-cs"></i>' . $newData['name'] . ' GB </a>';
    }

    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['6']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];
        $bw .= '<a class="list_content bw-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><i data-price="' . $price . '" class="icon-freenetwork cp-icons-cs"></i>' . $newData['name'] . '</a>';
    }
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['9']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];
        $storagetype .= '<a class="list_content type-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><i data-price="' . $price . '" class="icon-drivessd cp-icons-cs"></i>' . $newData['name'] . '</a>';
    }
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['4']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];
        $cpu .= '<a class="list_content cpu-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><i data-price="' . $price . '" class="icon-cpu cp-icons-cs"></i>' . $newData['name'] . ' Cores </a>';
    }
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['5']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];
        $productName = explode(":", $newData['name']);
        if ($productName['0'] == 'SSD') {

            $ssd .= '<a class="list_content ssd-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><i data-price="' . $price . '" class="icon-drivessd cp-icons-cs"></i>' . $productName['1'] . '</a>';
        }
    }
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['11']['options']['option'] as $newData) {
        if (strpos(str_replace(' ', '', $newData['name']), 'Choose') !== false) {
            $img = "select.svg";
        }
        if (strpos(str_replace(' ', '', $newData['name']), 'Cpanel') !== false) {
            $img = "cpanel.svg";
        }
        if (strpos(str_replace(' ', '', $newData['name']), 'CyberPower') !== false) {
            $img = "cyberpower-cloud.png";
        }
        if (strpos(str_replace(' ', '', $newData['name']), 'Directadmin') !== false) {
            $img = "directadmin.svg";
        }
        if (strpos(str_replace(' ', '', $newData['name']), 'Plesk') !== false) {
            $img = "plesk.svg";
        }

        $price = $newData['pricing']['USD']['monthly'];
        $cpsList .= '<a class="list_content cps-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><img src="/en/fonts/cyberpowersvg/family/' . $img . '" data-price="' . $price . '" class="op-svg" />' . $newData['name'] . '</a>';
    }




    // cpa
    foreach ($apiData['products']['product'][0]['configoptions']['configoption']['10']['options']['option'] as $newData) {
        $price = $newData['pricing']['USD']['monthly'];
        if (strpos(str_replace(' ', '', $newData['name']), 'Softaculous') !== false) {
            // if (strpos(strtolower($newData['name']), "Softaculous") !== false) {
            $img = "softacolous.png";
        }
        if (strpos(strtolower($newData['name']), "installatron") !== false) {
            $img = "instal.png";
        }
        if (strpos(strtolower($newData['name']), "needed") !== false) {
            $img = "close.svg";
        }
        $cpaList .= '<a class="list_content cpa-op" data-price="' . $price . '" rel="' . $newData['id'] . '"><img src="/en/fonts/cyberpowersvg/family/' . $img . '" data-price="' . $price . '" class="op-svg" />' . $newData['name'] . '</a>';
    }

    $FinalData = array("add_ip" => $additionip, "cpsList" => $cpsList, "bwList" => $bw, "ramList" => $ram, "storageType" => $storagetype, "regionList" => $regionList, "cpuList" => $cpu, "ssdList" => $ssd, "cpaList" => $cpaList, "osList" => $osList);
    $fullyManaged = $apiData['products']['product'][0]['configoptions']['configoption']['12']['options']['option'][0]['pricing']['USD']['monthly'];
    $price1 = $apiData['products']['product'][0]['configoptions']['configoption']['13']['options']['option'][0]['pricing']['USD']['monthly'];
    $FinalData['extra'] = array("f_managed" => $fullyManaged, "price1" => $price1);

    print_r(json_encode($FinalData));
}



if ($_POST['req'] == "extras") {

    $apiData = whmcs_getproduct($api_identifier, $api_secret, "155");
    $fullyManaged = $apiData['products']['product'][0]['configoptions']['configoption']['12']['options']['option'][0]['pricing']['USD']['monthly'];
    $price1 = $apiData['products']['product'][0]['configoptions']['configoption']['13']['options']['option'][0]['pricing']['USD']['monthly'];
    $exrapricing = array("f_managed" => $fullyManaged, "price1" => $price1);
    print_r(json_encode($exrapricing));
}

function whmcs_getproduct($api_identifier, $api_secret)
{
    $postfields = array(
        'identifier' => $api_identifier,
        'secret' => $api_secret,
        'action' => 'GetProducts',
        'responsetype' => 'json',
        'pid' => "169",
    );

    // Call the API
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://cyberpower.co.il/includes/api.php');
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postfields));
    $response = curl_exec($ch);
    if (curl_error($ch)) {
        die('Unable to connect: ' . curl_errno($ch) . ' - ' . curl_error($ch));
    }
    curl_close($ch);

    return json_decode($response, true);
}
