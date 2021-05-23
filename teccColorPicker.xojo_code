#tag Class
Protected Class teccColorPicker
Inherits WebSDKUIControl
	#tag Event
		Sub DrawControlInLayoutEditor(g as graphics)
		  // Visual WebSDK controls can "draw" themselves in the IDE
		  
		  g.FontName = "Helvetica"
		  g.FontUnit = FontUnits.Point
		  g.FontSize = 21
		  
		  If BooleanProperty("enabled") = False Then
		    g.Transparency = 60
		  Else
		    g.Transparency = 0
		  End If
		  
		  'If BooleanProperty("visible") = True Then
		  'Select Case IntegerProperty("CrownPosition")
		  'Case 0
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 66, 29, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(40,5,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 7, 22 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(45,10,8,8)
		  'Case 1
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 66, 29, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(10,5,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 43, 22 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(15,10,8,8)
		  'Case 2
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 29, 66, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(5,8,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 7, 60 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(10,13,8,8)
		  'Case 3
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 29, 66, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(5,40,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 6, 22 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(10,45,8,8)
		  'End Select
		  'end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  // Events sent with TriggerServerEvent using your controlID will end up here
		  Try
		    
		    Select Case Name
		    Case "teccColorPickerChange"
		      
		      Try
		        If parameters.value("target") = "INPUT" Then
		          If Me.Enabled Then
		            objectid = Parameters.value("ID")
		            mvalue = Parameters.value("value")
		            break
		            teccColorPickerChange()
		            
		            Return True
		          End If 
		        End If
		      Catch err As OutOfBoundsException
		        
		      End Try
		      
		    End Select
		    
		  Catch
		    
		  End Try
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(Request As WebRequest, Response As WebResponse) As Boolean
		  #Pragma unused Request
		  #Pragma unused Response
		  
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  // Name of your JavaScript class which extends XojoWeb.XojoVisualControl
		  Return "tecc.teccColorPicker"
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Self.Style.value("outline") = "none"
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  // Use this method to serialize the data your control needs for initial setup
		  
		  js.value("value") = value
		  'js.value("coloron") = "#" + ActiveColor.ToString.Right(6)
		  'js.value("coloroff") = "#" + DeactiveColor.ToString.Right(6)
		  'js.value("crownposition") = cposition 
		  'js.value("activecrown") = "#" + ActiveCrown.ToString.Right(6)
		  'js.value("deactivecrown") = "#" + DeactiveCrown.ToString.Right(6)
		  '
		  '
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionCSSURLs(session as WebSession) As String()
		  #Pragma unused Session
		  // Return an array of CSS URLs for your control
		  // Here's one way to do this...
		  
		  If teccColorPickerCSS = Nil Then
		    Var cssStr As String
		    Var css() As String
		    
		    css.Add(".ColorPicker {")
		    css.Add("margin:0 0 0 2rem;")
		    css.Add("position: relative;")
		    css.Add("display: inline-block;")
		    css.Add("width: 4rem;")
		    css.Add("height: 1.7rem;")
		    css.Add("--crown: white;")
		    css.Add("--deactive: #929292;")
		    css.Add("--deactive-crown: #ff0000;")
		    css.Add("}")
		    
		    css.Add(".ColorPicker Input {")
		    css.Add("display: none;")
		    css.Add("}")
		    
		    css.Add(".roundbutton {")
		    css.Add("position: absolute;")
		    css.Add("top: 0;")
		    css.Add("Left: -33px;")
		    css.Add("bottom: 0;")
		    css.Add("Right: 0;")
		    css.Add("width: 100%;")
		    css.Add("background-Color: #33455e;")
		    css.Add("display: block;")
		    css.Add("transition: all 0.3s;")
		    css.Add("border-radius: 1.7rem;")
		    css.Add("cursor: pointer;")
		    css.Add("}")
		    
		    css.Add(".roundbutton:before {")
		    css.Add("position: absolute;")
		    css.Add("content: '';")
		    css.Add("height: 1.15rem;")
		    css.Add("width: 1.15rem;")
		    css.Add("border-radius: 100%;")
		    css.Add("display: block;")
		    css.Add("Left: 0.45rem;")
		    css.Add("bottom: 0.3rem;")
		    css.Add("background-Color: var(--crown) !important;")
		    css.Add("transition: all 0.3s;")
		    css.Add("}")
		    
		    css.Add("Input:checked + .roundbutton {")
		    css.Add("background-Color: var(--deactive) !important;")
		    css.Add("}")
		    
		    css.Add("Input:checked + .roundbutton:before  {")
		    css.Add("background-Color: var(--deactive-crown) !important;")
		    css.Add("transition: background-Color;")
		    css.Add("transform: translate(1.9Rem, 0);")
		    css.Add("transition: all 0.3s;")
		    css.Add("}")
		    
		    cssStr = String.FromArray( css, "" )
		    
		    teccColorPickerCSS = New WebFile
		    teccColorPickerCSS.Filename = "teccColorPicker.css"
		    teccColorPickerCSS.MIMEType = "text/css"
		    teccColorPickerCSS.data = cssStr
		    teccColorPickerCSS.Session = Nil 
		  End If
		  
		  Var urls() As String
		  urls.Add( teccColorPickerCSS.URL )
		  
		  Return urls
		End Function
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  #Pragma unused session
		  // Return anything that you needed added to the <head> of the web app
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  #Pragma unused session
		  If JSFramework = Nil Then
		    JSFramework = New WebFile
		    JSFramework.Filename = "teccColorPicker.js"
		    JSFramework.MIMEType ="text/javascript"
		    JSFramework.data = kJSCode
		    JSFramework.Session = Nil 
		  End If
		  
		  Dim urls() As String
		  urls.Add( JSFramework.URL )
		  
		  Return urls
		End Function
	#tag EndEvent


	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074686520636F6E74726F6C20697320636C69636B65642E2052657475726E7320746865206368616E676564207374617475732E0A737461747573203D2074686520737461747573206F662074686520636F6E74726F6C2E0A6F626A6563746964203D20746865206964206F6620746865206372656174656420444F4D20656C656D656E742E
		Event teccColorPickerChange()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared JSFramework As WebFile
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			mValue = value
		#tag EndNote
		Private mvalue As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private objectid As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared teccColorPickerCSS As WebFile
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mvalue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mvalue = value
			  
			  Call teccColorPickerChange()
			End Set
		#tag EndSetter
		value As string
	#tag EndComputedProperty


	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar tecc;\n(function (tecc) {\n    class teccColorPicker extends XojoWeb.XojoVisualControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n        }\n        render() {\n            super.render();\n            let el \x3D this.DOMElement();\n            if (!el)\n                return;\n            this.setAttributes(el);\n            var idstr \x3D el.id + \"_teccColorPicker\";\n            let btn \x3D document.createElement(\"div\");\n            var disabledStr \x3D \"\";\n            var opacityStr \x3D \"\";\n            if (!this.enabled) {\n                disabledStr \x3D \"disabled\x3D\'disabled\'\";\n                opacityStr \x3D \";opacity: 20%\";\n            }\n            ;\n            var iOff \x3D \"\";\n            if (this.off \x3D\x3D true) {\n                iOff \x3D \"checked\x3D\'checked\'\";\n            }\n            ;\n            var cbid \x3D \"ts\" + idstr;\n            btn.innerHTML \x3D \"<input id\x3D\'\" + cbid + \"\' value\x3D\'\' name\x3D\'TextField1\' class\x3D\'form-control\' type\x3D\'color\' placeholder\x3D\'\' autocomplete\x3D\'off\' spellcheck\x3D\'false\' style\x3D\'width: 100%;\'>\";\n            btn.id \x3D idstr;\n            btn.addEventListener(\"input\"\x2C function (event) {\n                var controlObject \x3D XojoWeb.getNamedControl(el.id);\n                var jsonObj \x3D new XojoWeb.JSONItem();\n                jsonObj.set(\'ID\'\x2C el.id);\n                jsonObj.set(\'target\'\x2C event.target.tagName);\n                var c \x3D document.getElementById(cbid).value;\n                jsonObj.set(\'value\'\x2C c);\n                controlObject.triggerServerEvent(\'teccColorPickerChange\'\x2C jsonObj)\x2C true;\n            });\n            this.replaceEveryChild(btn);\n            this.applyTooltip(el);\n            this.applyUserStyle(el);\n        }\n        updateControl(data) {\n            super.updateControl(data);\n            let js \x3D $.parseJSON(data);\n            this.refresh();\n            this.value \x3D js.value;\n            \n        }\n    }\n    tecc.teccColorPicker \x3D teccColorPicker;\n})(tecc || (tecc \x3D {}));\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LibraryIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABemlDQ1BJQ0MgUHJvZmlsZQAAKJF9kE0rRFEYx38zXkZesqBYWNwYVkOMmtgoMwlloUF529y55kWZcbv3CtlYKFtFiY23BZ+AjYWyVkqRkp0vQGyk6zkujZfy1HOe33nOc/6d8wd/SDfNmcJWyOYcK94b1UbHxrXAA0XUUEwjNbphm92DgwNIfNWf8XKNT9WrZqX19/zfKJtK2gb4SoS7DNNyhPuEG+YdU7HSq7bkUcLLitMebyhOeHz0MTMcjwmfCmtGRp8SvhMOGRkrC36lH0x8m0l/4+zMnPH5HvWT8mRuZEhqvWQdNnF6iaLRTw8xIrTRKWuEZsK0yA4nueCoy7FZc9GaTmccrVucSGr9OaMlpIVbwzKjfP3tV743uwsdz1Cwlu8lNuFkFWpv873gDlSuwPG5qVv6R6tA0p9KweMhVIxB1SWUTtip9rD3o/IoFN277lMjBNbhbc11X/dc921fLotHZznPo08tDm5geAkGLmBrG5pEu3LyHRS8ZyXU0R7+AAAAbGVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgAAwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAGAAAAABAAAAYAAAAAEAAqACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAAAn+t5WAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAFj0lEQVRoBdVabWgcRRh+5+72dsx99NQYYxU1rUiwVkGR+oWIYiuoIFKKIv7wIxC1IFgUQQUREQtW2j+Conj9UQWlon+EIin9cQELLbbE2CBWKFJNYw2b3F5yu5u79ZlNLju53N7t3m7u4sBkZ+fjned555mPnQujdRRynCcomdgESI8Ro8eJ2HVE9jTZdJKq9kFi7LRW1GdkyEx+6WY6l01dA8BDAPk8cFzdAEsZRL5D3K8Vi8dr5euCQC6b6YPH8wD1EGKiBq7B00beJFWrz2jF0ogo7zoBBzzRV0DyQAPAXll/U5WeIMs6Hveq0Yn8XDZ9PSTzOcALzwcJabTppzg7EgvSKsq6uVRKhQBehM0H27ArlLODbLatayPAe9Tb4f0PASTdBgHRBNjZZV0hkCNSiauHAGKwTfCLzRhd2h0JZdM7geDuUOAXG/d2fBXKZVKcYrFR9H9beAL2aOdHgLF7Afza8OBhwaYfmm0abfeRy6R3UIztgQHsqPYRqtA+TdfPOwYZDeCZatu42/AvJL+NdBJjcjKeTb8A8F/D+GbEK5B1F94HeTJ5tGyaOjfMceLJK5F/C8rbdWAF3j+IzexwpAR4T08vxWOfLALHXzcMYMns5wmloFlWESRGSE0qyBPzIOlW8506hZF9DQe7qWgJqGofvD0EGBiMFUHMta0o2wISPzokGPsJZJMgsQ1lQUZiiiqVJ3EWGhc9REtAURIA+RTsQiKrgljxbkD5VVxJFrS5+RmMxCjk1OdTThV4fYwWKo9qpfmxmvVICZQta46ryjS8ej866Kl1Ij0FiS0gsTGgnExo/gvEN0ifO1OWDEZKQNjlhnUGHyW/Eottx2sjEkHlNEGV6nMYpU+h+fMyeNFf5ATQgc1N63dSlQsYCbHmNyLRTE5b0UZH/BMe/4BMaxhyG8cKZiFvVRCGIgnODrt4tpnABCtjFicom3oaIyEObL0enSwg/0taqO7RSqWLaKPShvSzyJskwzymlU3No91ydmQjwLk6hCOCWEKLZcM8gZGoQk5jQeXktDXMifJCpV4ty6DlRGgCwvMOeMY+huEMZPMIV5NTPKn8opmWFUBOG7mqjoHAtAywVToUAUc2jA0D9PvoCB8oS4Gx+5AqgsQph4RhjWNOTLaYE7fiK2s7VrFC2bAu1Ey1eoYisOR5AT5T15EKsPcg72IAOQkTvWh3Odp8U2fP87UtAnWycT2/shtBIqichIU4NrjPMAGwcbUOgQng/uYSANuN+B7Me4F3ew4up581w8y7BpqnAhPgKj8A8K/AbL1svHoKJqeq/TLW/LNexurzfRPA/U0Gq8R+TLSXYCToCdJLTufgjM2wZyCexcb1Knbb7+tBNnv3tZEJ8DDyLsAP48mbGWxR9g/Z9i5tVj9Wq+dsXul0P/L/xWYmduBAwe8xdi/Aix0yDHgcMugwzjQnZYTYag3S9XNyXpB00xFY8rwALy6gwgRxMZvXZoth7azC4PlRL8lGeD5MEODFEeP1MEa82jaTUFSyyaPzt+H9oheIMPmrJPR/kI1MeIWEcFssrjveXJqwcr2g6TWVjQxmBQFo9WGA340KYVebPGysmWxkAssScn6fUhO/YZkbkCsETK/ZauOFwx0BJXZnBODXbLVpTYDFbvaq5Csf6zzqdUQ2Mh55GRXfp+2EjstGBulKqGIX5AKf6Y6tNl54XAKlEiYwTXlVbJjfJdnIWFwJpVIKCvxee3dVNo0JxNkunwR07BcHUHevbKhbaWcE8JmIGwH2VksQNh3Fr+TvUIxOaLOl+Zb1O1AhgQ/0Tbg9+wh93Yg4gX+q2AcPH8IHRhW78h24iL0JB/kZqrLC8q8sHQDmu4vchswIou08M6lB3w3XScUEvI0N2JHGEO40/1gnuHzD+A8PDfFUQp8rGAAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NavigatorIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABfGlDQ1BJQ0MgUHJvZmlsZQAAKJF9kDlLA0EUx3+JR8QDCwUtLBavKopGEG2EJEgMpAhRwavZrDmEJC6bFRUbC8FWUBBtvAr9BNpYCNaCICiC2PkFFG1E1jdGiQf44M37zZs3f2b+4Pbqppkp7YJszrZioYA2Nj6heR4oo4Fy2nHpRt70R6MRJL7qz3i5xqXqVYfS+nv+b1RNJ/IGuCqEBwzTsoWHhFvmbVOx0qu35FHCy4pTBd5QHC/w0cfMSCwofCqsGWl9WvhO2GukrSy4lX5r/NtM6htnM3PG53vUT6oTudFhqc2STeSJESKARphBgvTSTb+svXTgo1N22IkFW10OzpqL1kwqbWt+cSKhhXNGp1fzdflkRvn6269ib3YX+p6hZK3Yi2/CySo03hZ7rTtQuwLH56Zu6R+tEkl3MgmPh1AzDnWXUDmZT/b4Cj+qDkDZveM8tYFnHd7WHOd1z3He9uWyeHSWK3j0qcXBDYwsQeQCtrahXbRrp94B6fJnEOjpULwAAABsZVhJZk1NACoAAAAIAAQBGgAFAAAAAQAAAD4BGwAFAAAAAQAAAEYBKAADAAAAAQACAACHaQAEAAAAAQAAAE4AAAAAAAAAYAAAAAEAAABgAAAAAQACoAIABAAAAAEAAAAQoAMABAAAAAEAAAAQAAAAAMiYw6gAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAFkSURBVDgRlZIxSwNBEIVnLyKE5OKKiCCWgiAIdloFJFiJhdb+kGsUu2hh4d+wsFGxEmw0WAnaWQSxjCKnl0MIeOu3xMhtLtFz4B0zO/PezM6eyD9Mj/k1cAdewaH2S6OFvHwIq9SegWlQBEui1ITC+dN0uVSUgvdA4Uxf8cdI34ET0nVRjHmk0/oAsq1teg4jFeiKXyW8hXwlJmng36TS1k1AMFRAlHmi4BnMi/KOEdnC74m0mGwjfItOh+5AV8rLIiaGfAFxEtwjsklclcQchVG7zZkMnIC7B4zeoHgNUo06O8kC8TmiJz3yQAHI2yTqNonV+0RmRZTzEs4VWBwECbrc1NfICp2blhy+R9epjPw84y/kfUiX3yS72Kwx9i4wGVT8vWy1e6K0Xx4XT9klub+1Eds5ex2Xb1/BfHLm7EJykq2WR/eplEAHfydPZ0u2xhLVAX/VHF1fmKYTRnHcTeX7fgGX7XCKeEX2kgAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant


	#tag Enum, Name = cpositions, Type = Integer, Flags = &h0
		Right
		  Left
		  Top
		Bottom
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="34"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Visual Controls"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=false
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
