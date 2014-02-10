%module angel
%{
#include "../../Infrastructure/Textures.h"
%}

void FlushTextureCache();
int GetTextureReference(const String& name, bool optional = false);
int GetTextureReference(const String& filename, GLint clampmode, GLint filtermode, bool optional = false);
Vec2i GetTextureSize(const String& filename);
bool PurgeTexture(const String& filename);
