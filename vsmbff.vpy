import vapoursynth as vs
core = vs.core
core.std.LoadAllPlugins("/usr/src/app/libs")
import havsfunc
clip = core.lsmas.LWLibavSource(source="/usr/src/app/pj.mkv", cache=0)
clip = havsfunc.QTGMC(clip, TFF=False, Preset='Medium', InputType=0, TR2=2, SourceMatch=3, Sharpness=0.2)
clip.set_output()
