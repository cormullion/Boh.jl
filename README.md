## Boh

Draw Baltimore's Natty Boh. Requires Luxor.jl.

__This image is most probably protected as a Federal Trademark, and thus should not be used in any context without explicit permission from the trademark owners.
There's [some dispute](https://www.trademarkologist.com/2014/07/anheuser-bush-lays-claims-to-natty-but-what-about-natty-boh/) about the ownership of this popular image. I recommend you don't use it at all except under the terms of Fair Use...__

### Usage under Fair Use doctrine

On this page the image is used under the terms of Fair Use in the United States: 

1: 'transformative' - it's used as the basis for graphic modifications and transformations

2: 'nonprofit and educational purposes' - it provides an educational example of how to manipulate graphic images in code and no monies are involved

3: 'the effect of the use upon the potential market for or value of the copyrighted work' - this shouldn't impact the market perception of the image in any way (other than positively). The images here are unlikely to be viewed by the general public.

### Usage

Basic usage:

```julia
using Luxor
@svg boh()
```

![image 1](images/image1.svg)

Filled by default. Or you can stroke:

```julia
using Luxor
@svg begin
    setline(3)
    randomhue()
    boh(:stroke)
end 200 200 "/tmp/boh-stroke.svg"
```

![image 2](images/image2.svg)

Or use him as a clipping region:

```julia
using Luxor
@svg begin
    boh(:clip)
    setblend(
       blend(
    		boxtopcenter(BoundingBox()),
    		boxbottomcenter(BoundingBox()),
    		"blue",
    		"magenta"))
    box(O, 200, 200, :fill)
end 200 200 "/tmp/boh.svg"
```

![image 3](images/image3.svg)

Or just play around:

```julia
@svg begin
    background("skyblue")
    prettypoly(polysample(box(BoundingBox() - 20, vertices=true), 20), :none, () -> begin
        @layer begin
            scale(0.1)
            randomhue()
            boh(:fill)
            setline(3)
            circle(O, 120, :stroke)
        end
    end)
    clipreset()
    setline(3)
    sethue(Luxor.darker_green)
    boh(:fill)
end 250 250 "/tmp/boh.svg"
```

![image 4](images/image4.svg)
