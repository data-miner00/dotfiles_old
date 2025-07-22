function Show-LoremIpsum {
    $SampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut blandit pellentesque nisi, vel aliquet est. Nullam mattis convallis mauris, nec bibendum diam sodales ut. Proin pharetra, orci id sagittis tempus, augue lectus facilisis metus, eget suscipit odio leo in dui. Etiam in tincidunt odio. Nam et ex pretium, imperdiet dui ut, ultricies mauris. Donec id ornare sapien, vitae iaculis enim. Pellentesque lacinia placerat ligula quis porttitor. Duis ullamcorper feugiat leo, sit amet vestibulum nulla pretium in. Duis arcu orci, porta sit amet luctus vitae, elementum a mauris. Sed luctus ultricies nisi non egestas. Vestibulum velit neque, facilisis eu bibendum eget, hendrerit non sapien. Sed a viverra lacus. Sed maximus at odio quis vulputate. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras facilisis, nunc in ultrices placerat, mauris neque ornare libero, non ullamcorper lacus lacus id turpis. "

    Write-Host $SampleText -ForegroundColor Cyan
}

Export-ModuleMember -Function Show-LoremIpsum
