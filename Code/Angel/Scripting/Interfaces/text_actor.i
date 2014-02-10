%module angel
%{
#include "../../Actors/TextActor.h"
%}

enum TextAlignment
{
	TXT_Left,
	TXT_Center,
	TXT_Right
};

class TextActor : public Actor
{
public:
	TextActor(const String& fontNickname="Console", const String& displayString="", TextAlignment align=TXT_Left, int lineSpacing=5);

	virtual void Render();
	virtual void ReceiveMessage(Message* message);

	virtual void SetPosition(float x, float y);
	virtual void SetPosition(const Vector2 position);

	virtual void SetRotation(float newRotation);

	const String& GetFont();
	void SetFont(const String& newFont);

	const String& GetDisplayString();
	void SetDisplayString(const String& newString);

	TextAlignment GetAlignment() const;
	void SetAlignment(TextAlignment newAlignment);

	int GetLineSpacing() const;
	void SetLineSpacing(int newSpacing);

	virtual String GetClassName() const;
};


