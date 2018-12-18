## Boh

Draw Baltimore's boh. Requires Luxor.jl.

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
