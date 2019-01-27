<?php

return [
    'alipay' => [
        'app_id'         => '2016091400507317',
        'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlaLZQyZRkYjU0fyC+wkr8Ly+DwzBp7AzqMMaKpXpVDUKR9XqzGXqTjkACtJTcAv0nu7z7boZg7ZDq2Hh8NGaoLj0pLXlGkWEzJu0flLpUCQ5cZUjwZoDShxNgwCQZkvZMq0lAFzgvmMHsRAGPD1aKkJP9I/bEBV6qV//loUo2PEmaxjh+KLEa8eVmrDF5osejfr99svp0BpdMHfW2IyfIqYkW3P+cw/yRr4oTOEDbJZhwZ8pTaXKaftCukYYK+EfPMviANA9GiMG/rHME90D3YdyqdOvwt1x3TAMilrkMZg5rjSqQ4y3I0c+ldS8caB1vK2dY43arRStQTeyfAZ5+QIDAQAB',
        'private_key'    => 'MIIEowIBAAKCAQEAtu1Plf5IjTD1HTt8WSpviUafQglXuO64DJLMsxTUQ4wljONDWrTHSBaracqimBe1mUdzs+c2lja1ebAIGdGH2Jov7GlM08AhGcgb8XulBZELAGFz3qRCrICGlbTHgMFoIsbYjdLjFBFvhIAoF2DB/0m//vuCOWbtnY5xnQ9dDRYULzt7h+WsdxYyiUqe9D84xqSesZHxadnjbnAK4LVisFMJBiJEn6NuExN9FD7dFS6qAW8yYOpZJhe0IW+uDbq9qVrFe4M/XowZD0hQDq1NXbtA30rzDVxQchki9aUqtMfzUthDPsQUoI+blXJ7lvaU8rcmWKJ7rXVZ6b1e0tCpvQIDAQABAoIBABqHxpAphho8LICl3P4NoomVXYm1Uyy2KqlgLSIX9kUpsVSCrYUdTP3Ok+PPCM/oOGVXsJc6BHe6zY0tk68y7XHjwumVyBe5+NMFa9AVL7Tj+WV/vM9goW7lYR+bTYgGBPVuQ4AmQtrpQHRGJgpl9RzydE8l6RgsLnA4dY/i54r7Frvdu65rRd3W7EHSg/HH7mVbXqVyxsqBih5jsawso9a4AOaFXuJJz9502JMbP7WPRFTx/JiauBzPx3Pqk0IqIWxJS/zlb9xm01hXIpT/35kyFbn2rQTJ5VJ8ARXnCkx708f6PxmUpv+aF/FMFTO5Ycr2Per9vKkVwPQ4HxzjZn0CgYEA7bmyY04w46voWos6xNld4SA4dfD0Hgt8lXw1iaEFDdG5IVVi6N17EjJyGb7S27w/cweatnZz5RGnGjPDfxa7L7rMUgVSrrHyUWeiDSI0cS46xvwcFCI3m65q+AjKsdbnw7XPysNO6GNDHVINicbPzGtsUJuNIl/SOoeE98oX2R8CgYEAxP02Xjh+1FhQjtlG/ZFqpJ4NdkViwTVBaWuDhONoQgiYI0Ck7RJ7CiDEGqRr9NQgo9xv9G0NoxdFUAFHeb0HDY6Z3QH2J1Df67bF4hF+NCXCtPpBBjOYkdlFn+YJMiBDPThNXRiJ7DZf3tXNbpKltJ2XkiFIvytd9QS7sV6SNaMCgYB06MwH9l4ouVQtoyclw9hdbKEXr4X+eJuuUEVsB9oab7dh40IfTzzFODXQ332HPs7dXTIC5cIdN088nZRZHe60jGMLOz7sVuraieKyHs43kwqo7TdJ14INd/t3O6ujRhL4tqMYDnDx7E8HTmEGDtYGrBW6lqUT8JfM3PTRf3u29QKBgGv3nOTnchxQi1bAH/i6ywiO2DIKtaXP2po9I0iim3IV48zukXaeunFCpDk2BTWbToiBOZtuahsJliPTj6lZwZPcpNhNSu0hlplLBAp0LAfI6n7m6tzLSsQlodOR8VhX9oKHaV+tI2skIkewR3hjSA9GkNy3AXhF/KlefsEoZFqhAoGBANqqKtrMYYGHIpzfVKog0E6d7Eu7l+/LvjoLxZf3mciKL+8ujLKtQqICCtKd6uhp/A0l3lkrvXd2OwDbZAlvaiyq8XR94mjKG8IBlThu6zkEI4MiEAyoQYa/WBh+ofEYu0wc7PD6CkP6ACZRZp3QUdlKf34eDD/cw1MlqrzBNOWY',
        'log'            => [
            'file' => storage_path('logs/alipay.log'),
        ],
    ],

    'wechat' => [
        'app_id'        => '',
        'mch_id'        => '',
        'key'           => '',
        'cert_client'   => '',
        'cert_key'      => '',
        'log'           => [
            'file' => storage_path('logs/wechat_pay.log'),
        ],
    ],
];