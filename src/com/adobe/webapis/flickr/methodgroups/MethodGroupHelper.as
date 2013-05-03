package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.crypto.*;
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.xml.*;

    class MethodGroupHelper extends Object
    {

        function MethodGroupHelper()
        {
            return;
        }// end function

        static function invokeMethod(param1:FlickrService, param2:Function, param3:String, param4:Boolean, ... args) : void
        {
            var _loc_11:String = null;
            var _loc_12:int = 0;
            args = new Array();
            args.push(new NameValuePair("api_key", param1.api_key));
            args.push(new NameValuePair("method", param3));
            var _loc_7:int = 0;
            while (_loc_7 < args.length)
            {
                
                if (args[_loc_7] is NameValuePair)
                {
                    args.push(args[_loc_7]);
                }
                else
                {
                    args.push(new NameValuePair("param" + _loc_7, args[_loc_7].toString()));
                }
                _loc_7++;
            }
            if (param1.permission != AuthPerm.NONE && param1.token)
            {
                args.push(new NameValuePair("auth_token", param1.token));
                param4 = true;
            }
            if (param4)
            {
                args.sortOn("name");
                _loc_11 = param1.secret;
                _loc_12 = 0;
                while (_loc_12 < args.length)
                {
                    
                    _loc_11 = _loc_11 + (args[_loc_12].name.toString() + args[_loc_12].value.toString());
                    _loc_12++;
                }
                args.push(new NameValuePair("api_sig", MD5.hash(_loc_11)));
            }
            var _loc_8:String = "";
            var _loc_9:int = 0;
            while (_loc_9 < args.length)
            {
                
                _loc_8 = _loc_8 + (args[_loc_9].name + "=" + args[_loc_9].value + "&");
                _loc_9++;
            }
            var _loc_10:* = flickrservice_internal::urlLoader;
            flickrservice_internal::urlLoader.addEventListener("complete", param2);
            _loc_10.load(new URLRequest(FlickrService.END_POINT + _loc_8));
            return;
        }// end function

        static function processAndDispatch(param1:FlickrService, param2:String, param3:FlickrResultEvent, param4:String = "", param5:Function = null) : void
        {
            var _loc_6:* = processResponse(param2, param4, param5);
            param3.success = _loc_6.success;
            param3.data = _loc_6.data;
            param1.dispatchEvent(param3);
            return;
        }// end function

        static function processResponse(param1:String, param2:String, param3:Function) : Object
        {
            var _loc_7:FlickrError = null;
            var _loc_4:* = new Object();
            new Object().data = new Object();
            var _loc_5:* = new XMLDocument();
            new XMLDocument().ignoreWhite = true;
            _loc_5.parseXML(param1);
            var _loc_6:* = _loc_5.firstChild;
            _loc_5 = null;
            if (_loc_6.attributes.stat == "ok")
            {
                _loc_4.success = true;
                if (param3 == null)
                {
                    _loc_4.data = XML(_loc_6);
                }
                else
                {
                    _loc_4.data[param2] = MethodGroupHelper.param3(XML(_loc_6));
                }
            }
            else
            {
                _loc_4.success = false;
                _loc_7 = new FlickrError();
                if (_loc_6.firstChild != null)
                {
                    _loc_7.errorCode = int(_loc_6.firstChild.attributes.code);
                    _loc_7.errorMessage = _loc_6.firstChild.attributes.msg;
                    _loc_4.data.error = _loc_7;
                }
                else
                {
                    _loc_7.errorCode = -1;
                    _loc_7.errorMessage = _loc_6.nodeValue;
                    _loc_4.data.error = _loc_7;
                }
            }
            return _loc_4;
        }// end function

        static function dateToString(param1:Date) : String
        {
            if (param1 == null)
            {
                return "";
            }
            return param1.getFullYear() + "-" + (param1.getMonth() + 1) + "-" + param1.getDate() + " " + param1.getHours() + ":" + param1.getMinutes() + ":" + param1.getSeconds();
        }// end function

        static function stringToDate(param1:String = "") : Date
        {
            var _loc_4:Array = null;
            var _loc_5:Array = null;
            if (param1 == "")
            {
                return null;
            }
            var _loc_2:* = new Date();
            var _loc_3:* = param1.split(" ");
            if (_loc_3.length == 2)
            {
                _loc_4 = _loc_3[0].split("-");
                _loc_5 = _loc_3[1].split(":");
                _loc_2.setFullYear(_loc_4[0]);
                _loc_2.setMonth((_loc_4[1] - 1));
                _loc_2.setDate(_loc_4[2]);
                _loc_2.setHours(_loc_5[0]);
                _loc_2.setMinutes(_loc_5[1]);
                _loc_2.setSeconds(_loc_5[2]);
            }
            else
            {
                _loc_2.setTime(parseInt(param1) * 1000);
            }
            return _loc_2;
        }// end function

        static function parseAuthResult(param1:XML) : AuthResult
        {
            var _loc_2:* = new AuthResult();
            _loc_2.token = param1.auth.token.toString();
            _loc_2.perms = param1.auth.perms.toString();
            _loc_2.user = new User();
            _loc_2.user.nsid = param1.auth.user.@nsid.toString();
            _loc_2.user.username = param1.auth.user.@username.toString();
            _loc_2.user.fullname = param1.auth.user.@fullname.toString();
            return _loc_2;
        }// end function

        static function parseFrob(param1:XML) : String
        {
            return param1.frob.toString();
        }// end function

        static function parseBlogList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:Blog = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.blogs.blog)
            {
                
                _loc_4 = new Blog();
                _loc_4.id = _loc_3.@id.toString();
                _loc_4.name = _loc_3.@name.toString();
                _loc_4.needsPassword = _loc_3.@needspassword.toString() == "1";
                _loc_4.url = _loc_3.@url.toString();
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parseContactList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:User = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.contacts.contact)
            {
                
                _loc_4 = new User();
                _loc_4.nsid = _loc_3.@nsid.toString();
                _loc_4.username = _loc_3.@username.toString();
                _loc_4.fullname = _loc_3.@realname.toString();
                _loc_4.isFriend = _loc_3.@friend.toString() == "1";
                _loc_4.isFamily = _loc_3.@family.toString() == "1";
                _loc_4.isIgnored = _loc_3.@ignored.toString() == "1";
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePagedPhotoList(param1:XML) : PagedPhotoList
        {
            var _loc_4:XML = null;
            var _loc_5:Photo = null;
            var _loc_2:* = new PagedPhotoList();
            _loc_2.page = parseInt(param1.photos.@page);
            _loc_2.pages = parseInt(param1.photos.@pages);
            _loc_2.perPage = parseInt(param1.photos.@perpage);
            _loc_2.total = parseInt(param1.photos.@total);
            var _loc_3:* = new Array();
            for each (_loc_4 in param1.photos.photo)
            {
                
                _loc_5 = new Photo();
                _loc_5.id = _loc_4.@id.toString();
                _loc_5.ownerId = _loc_4.@owner.toString();
                _loc_5.secret = _loc_4.@secret.toString();
                _loc_5.server = parseInt(_loc_4.@server);
                _loc_5.title = _loc_4.@title.toString();
                _loc_5.isPublic = _loc_4.@ispublic.toString() == "1";
                _loc_5.isFriend = _loc_4.@isfriend.toString() == "1";
                _loc_5.isFamily = _loc_4.@isfamily.toString() == "1";
                if (_loc_4.@license.toString())
                {
                    _loc_5.license = parseInt(_loc_4.@license);
                }
                _loc_5.dateUploaded = stringToDate(_loc_4.@dateupload.toString());
                _loc_5.dateTaken = stringToDate(_loc_4.@datetaken.toString());
                _loc_5.dateAdded = stringToDate(_loc_4.@dateadded.toString());
                _loc_5.ownerName = _loc_4.@ownername.toString();
                if (_loc_4.@iconserver.toString())
                {
                    _loc_5.iconServer = parseInt(_loc_4.@iconserver);
                }
                _loc_5.originalFormat = _loc_4.@originalformat.toString();
                _loc_5.farm = parseInt(_loc_4.@farm);
                _loc_3.push(_loc_5);
            }
            _loc_2.photos = _loc_3;
            return _loc_2;
        }// end function

        static function parseGroupCategory(param1:XML) : Category
        {
            var _loc_3:XML = null;
            var _loc_4:XML = null;
            var _loc_5:Category = null;
            var _loc_6:Group = null;
            var _loc_2:* = new Category();
            _loc_2.name = param1.category.@name.toString();
            _loc_2.path = param1.category.@path.toString();
            _loc_2.pathIds = param1.category.@pathids.toString();
            for each (_loc_3 in param1.category.subcat)
            {
                
                _loc_5 = new Category();
                _loc_5.id = _loc_3.@id.toString();
                _loc_5.name = _loc_3.@name.toString();
                _loc_5.count = parseInt(_loc_3.@count);
                _loc_2.subCategories.push(_loc_5);
            }
            for each (_loc_4 in param1.category.group)
            {
                
                _loc_6 = new Group();
                _loc_6.nsid = _loc_4.@id.toString();
                _loc_6.name = _loc_4.@name.toString();
                _loc_6.members = parseInt(_loc_4.@members);
                _loc_6.online = parseInt(_loc_4.@online);
                _loc_6.chatNsid = _loc_4.@chatnsid.toString();
                _loc_6.inChat = parseInt(_loc_4.@inchat);
                _loc_2.groups.push(_loc_6);
            }
            return _loc_2;
        }// end function

        static function parseGroup(param1:XML) : Group
        {
            var _loc_2:* = new Group();
            _loc_2.nsid = param1.group.@id.toString();
            if (_loc_2.nsid == "")
            {
                _loc_2.nsid = param1.group.@nsid.toString();
            }
            _loc_2.name = param1.group.name.toString();
            if (_loc_2.name == "")
            {
                _loc_2.name = param1.group.groupname.toString();
            }
            _loc_2.description = param1.group.description.toString();
            if (param1.group.members.toString())
            {
                _loc_2.members = parseInt(param1.group.members);
            }
            if (param1.group.privacy.toString())
            {
                _loc_2.privacy = parseInt(param1.group.privacy);
            }
            _loc_2.url = param1.group.@url.toString();
            return _loc_2;
        }// end function

        static function parsePagedGroupList(param1:XML) : PagedGroupList
        {
            var _loc_3:XML = null;
            var _loc_4:Group = null;
            var _loc_2:* = new PagedGroupList();
            _loc_2.page = parseInt(param1.groups.@page);
            _loc_2.pages = parseInt(param1.groups.@pages);
            _loc_2.perPage = parseInt(param1.groups.@perpage);
            _loc_2.total = parseInt(param1.groups.@total);
            for each (_loc_3 in param1.groups.group)
            {
                
                _loc_4 = new Group();
                _loc_4.nsid = _loc_3.@nsid.toString();
                _loc_4.name = _loc_3.@name.toString();
                _loc_4.isEighteenPlus = _loc_3.@eighteenplus.toString() == "1";
                _loc_2.groups.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parseContext(param1:XML) : Array
        {
            var _loc_2:* = new Array();
            var _loc_3:* = new Photo();
            _loc_3.id = param1.prevphoto.@id.toString();
            _loc_3.secret = param1.prevphoto.@secret.toString();
            _loc_3.title = param1.prevphoto.@title.toString();
            _loc_3.url = param1.prevphoto.@url.toString();
            _loc_2.push(_loc_3);
            _loc_3 = new Photo();
            _loc_3.id = param1.nextphoto.@id.toString();
            _loc_3.secret = param1.nextphoto.@secret.toString();
            _loc_3.title = param1.nextphoto.@title.toString();
            _loc_3.url = param1.nextphoto.@url.toString();
            _loc_2.push(_loc_3);
            return _loc_2;
        }// end function

        static function parseGroupList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:Group = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.groups.group)
            {
                
                _loc_4 = new Group();
                _loc_4.nsid = _loc_3.@nsid.toString();
                _loc_4.name = _loc_3.@name.toString();
                _loc_4.isAdmin = _loc_3.@admin.toString == "1";
                if (_loc_3.@privacy.toString())
                {
                    _loc_4.privacy = parseInt(_loc_3.@privacy);
                }
                if (_loc_3.@photos.toString())
                {
                    _loc_4.photos = parseInt(_loc_3.@photos);
                }
                if (_loc_3.@iconserver.toString())
                {
                    _loc_4.iconServer = parseInt(_loc_3.@iconserver);
                }
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parseUser(param1:XML) : User
        {
            var _loc_2:* = new User();
            _loc_2.nsid = param1.user.@nsid.toString();
            if (_loc_2.nsid.length == 0)
            {
                _loc_2.nsid = param1.user.@id.toString();
            }
            _loc_2.username = param1.user.username.toString();
            _loc_2.isPro = param1.user.@ispro.toString() == "1";
            _loc_2.bandwidthMax = Number(param1.user.bandwidth.@max.toString());
            _loc_2.bandwidthUsed = Number(param1.user.bandwidth.@used.toString());
            _loc_2.filesizeMax = Number(param1.user.filesize.@max.toString());
            _loc_2.url = param1.user.@url.toString();
            return _loc_2;
        }// end function

        static function parsePerson(param1:XML) : User
        {
            var _loc_2:* = new User();
            _loc_2.nsid = param1.person.@nsid.toString();
            _loc_2.isAdmin = param1.person.@isadmin.toString() == "1";
            _loc_2.isPro = param1.person.@ispro.toString() == "1";
            _loc_2.iconServer = parseInt(param1.person.@iconserver);
            _loc_2.username = param1.person.username.toString();
            _loc_2.fullname = param1.person.realname.toString();
            _loc_2.mboxSha1Sum = param1.person.mbox_sha1sum.toString();
            _loc_2.location = param1.person.location.toString();
            _loc_2.photoUrl = param1.person.photosurl.toString();
            _loc_2.profileUrl = param1.person.profileurl.toString();
            _loc_2.firstPhotoUploadDate = stringToDate(param1.person.photos.firstdate.toString());
            _loc_2.firstPhotoTakenDate = stringToDate(param1.person.photos.firstdatetaken.toString());
            _loc_2.photoCount = parseInt(param1.person.photos.count);
            return _loc_2;
        }// end function

        static function parsePhotoContext(param1:XML) : PhotoContext
        {
            var _loc_3:XML = null;
            var _loc_4:XML = null;
            var _loc_5:PhotoSet = null;
            var _loc_6:PhotoPool = null;
            var _loc_2:* = new PhotoContext();
            for each (_loc_3 in param1.set)
            {
                
                _loc_5 = new PhotoSet();
                _loc_5.id = _loc_3.@id.toString();
                _loc_5.title = _loc_3.@title.toString();
                _loc_2.sets.push(_loc_5);
            }
            for each (_loc_4 in param1.pool)
            {
                
                _loc_6 = new PhotoPool();
                _loc_6.id = _loc_4.@id.toString();
                _loc_6.title = _loc_4.@title.toString();
                _loc_2.pools.push(_loc_6);
            }
            return _loc_2;
        }// end function

        static function parsePhotoList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:Photo = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.photos.photo)
            {
                
                _loc_4 = new Photo();
                _loc_4.id = _loc_3.@id.toString();
                _loc_4.ownerId = _loc_3.@owner.toString();
                _loc_4.secret = _loc_3.@secret.toString();
                _loc_4.server = parseInt(_loc_3.@server);
                _loc_4.ownerName = _loc_3.@username.toString();
                _loc_4.title = _loc_3.@title.toString();
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePhotoCountList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:PhotoCount = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.photocounts.photocount)
            {
                
                _loc_4 = new PhotoCount();
                _loc_4.count = parseInt(_loc_3.@count);
                _loc_4.fromDate = stringToDate(_loc_3.@fromdate.toString());
                _loc_4.toDate = stringToDate(_loc_3.@todate.toString());
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePhotoExifs(param1:XML) : Photo
        {
            var _loc_3:XML = null;
            var _loc_4:PhotoExif = null;
            var _loc_2:* = new Photo();
            _loc_2.id = param1.photo.@id.toString();
            _loc_2.secret = param1.photo.@secret.toString();
            _loc_2.server = parseInt(param1.photo.@server);
            for each (_loc_3 in param1.photo.exif)
            {
                
                _loc_4 = new PhotoExif();
                _loc_4.tag = parseInt(_loc_3.@tag);
                _loc_4.tagspaceId = parseInt(_loc_3.@tagspaceid);
                _loc_4.tagspace = _loc_3.@tagspace.toString();
                _loc_4.label = _loc_3.@label.toString();
                _loc_4.raw = _loc_3.raw.toString();
                _loc_4.clean = _loc_3.clean.toString();
                _loc_2.exifs.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePhoto(param1:XML) : Photo
        {
            var _loc_3:XML = null;
            var _loc_4:XML = null;
            var _loc_5:XML = null;
            var _loc_6:PhotoNote = null;
            var _loc_7:PhotoTag = null;
            var _loc_8:PhotoUrl = null;
            var _loc_2:* = new Photo();
            _loc_2.id = param1.photo.@id.toString();
            _loc_2.secret = param1.photo.@secret.toString();
            if (param1.photo.@server.toString())
            {
                _loc_2.server = parseInt(param1.photo.@server);
            }
            _loc_2.isFavorite = param1.photo.@isfavorite.toString == "1";
            if (param1.photo.@license.toString())
            {
                _loc_2.license = parseInt(param1.photo.@license);
            }
            if (param1.photo.@rotation.toString())
            {
                _loc_2.rotation = parseInt(param1.photo.@rotation);
            }
            _loc_2.originalFormat = param1.photo.@originalformat.toString();
            _loc_2.ownerId = param1.photo.owner.@nsid.toString();
            _loc_2.ownerName = param1.photo.owner.@username.toString();
            _loc_2.ownerRealName = param1.photo.owner.@realname.toString();
            _loc_2.ownerLocation = param1.photo.owner.@location.toString();
            _loc_2.title = param1.photo.title.toString();
            _loc_2.description = param1.photo.description.toString();
            if (param1.photo.permissions.@permcomment.toString())
            {
                _loc_2.commentPermission = parseInt(param1.photo.permissions.@permcomment);
            }
            if (param1.photo.permissions.@permaddmeta.toString())
            {
                _loc_2.addMetaPermission = parseInt(param1.photo.permissions.@permaddmeta);
            }
            _loc_2.dateAdded = stringToDate(param1.photo.dates.@posted.toString());
            _loc_2.dateTaken = stringToDate(param1.photo.dates.@taken.toString());
            if (param1.photo.editability.@cancomment.toString())
            {
                _loc_2.canComment = parseInt(param1.photo.editability.@cancomment);
            }
            if (param1.photo.editability.@canaddmeta.toString())
            {
                _loc_2.canAddMeta = parseInt(param1.photo.editability.@canaddmeta);
            }
            if (param1.photo.comments.toString())
            {
                _loc_2.commentCount = parseInt(param1.photo.comments);
            }
            for each (_loc_3 in param1.photo.notes.note)
            {
                
                _loc_6 = new PhotoNote();
                _loc_6.id = _loc_3.@id.toString();
                _loc_6.authorId = _loc_3.@author.toString();
                _loc_6.authorName = _loc_3.@authorname.toString();
                _loc_6.rectangle = new Rectangle();
                _loc_6.rectangle.x = parseInt(_loc_3.@x);
                _loc_6.rectangle.y = parseInt(_loc_3.@y);
                _loc_6.rectangle.width = parseInt(_loc_3.@w);
                _loc_6.rectangle.height = parseInt(_loc_3.@h);
                _loc_6.note = _loc_3.toString();
                _loc_2.notes.push(_loc_6);
            }
            for each (_loc_4 in param1.photo.tags.tag)
            {
                
                _loc_7 = new PhotoTag();
                _loc_7.id = _loc_4.@id.toString();
                _loc_7.authorId = _loc_4.@author.toString();
                _loc_7.raw = _loc_4.@raw.toString();
                _loc_7.tag = _loc_4.toString();
                _loc_2.tags.push(_loc_7);
            }
            for each (_loc_5 in param1.photo.urls.url)
            {
                
                _loc_8 = new PhotoUrl();
                _loc_8.type = _loc_5.@type.toString();
                _loc_8.url = _loc_5.toString();
                _loc_2.urls.push(_loc_8);
            }
            return _loc_2;
        }// end function

        static function parsePhotoPerms(param1:XML) : Photo
        {
            var _loc_2:* = new Photo();
            _loc_2.id = param1.perms.@id.toString();
            _loc_2.isPublic = param1.perms.@ispublic.toString() == "1";
            _loc_2.isFriend = param1.perms.@isfriend.toString() == "1";
            _loc_2.isFamily = param1.perms.@isfamily.toString() == "1";
            _loc_2.canComment = parseInt(param1.perms.@permcomment);
            _loc_2.canAddMeta = parseInt(param1.perms.@permaddmeta);
            return _loc_2;
        }// end function

        static function parsePhotoSizeList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:PhotoSize = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.sizes.size)
            {
                
                _loc_4 = new PhotoSize();
                _loc_4.label = _loc_3.@label.toString();
                _loc_4.width = parseInt(_loc_3.@width);
                _loc_4.height = parseInt(_loc_3.@height);
                _loc_4.source = _loc_3.@source.toString();
                _loc_4.url = _loc_3.@url.toString();
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parseLicenseList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:License = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.licenses.license)
            {
                
                _loc_4 = new License();
                _loc_4.id = parseInt(_loc_3.@id);
                _loc_4.name = _loc_3.@name.toString();
                _loc_4.url = _loc_3.@url.toString();
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePhotoNote(param1:XML) : PhotoNote
        {
            var _loc_2:* = new PhotoNote();
            _loc_2.id = param1.note.@id.toString();
            return _loc_2;
        }// end function

        static function parseUploadTicketList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:UploadTicket = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.uploader.ticket)
            {
                
                _loc_4 = new UploadTicket();
                _loc_4.id = _loc_3.@id.toString();
                _loc_4.photoId = _loc_3.@photoid.toString();
                _loc_4.isComplete = _loc_3.@complete.toString() == "1";
                _loc_4.uploadFailed = _loc_3.@complete.toString() == "2";
                _loc_4.isInvalid = _loc_3.@invalid.toString() == "1";
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePhotoSet(param1:XML) : PhotoSet
        {
            var _loc_3:XML = null;
            var _loc_4:Photo = null;
            var _loc_2:* = new PhotoSet();
            _loc_2.id = param1.photoset.@id.toString();
            _loc_2.url = param1.photoset.@url.toString();
            _loc_2.ownerId = param1.photoset.@owner.toString();
            _loc_2.primaryPhotoId = param1.photoset.@primary.toString();
            if (param1.photoset.@photos.toString())
            {
                _loc_2.photoCount = parseInt(param1.photoset.@photos.toString());
            }
            _loc_2.title = param1.photoset.title.toString();
            _loc_2.description = param1.photoset.description.toString();
            _loc_2.secret = param1.photoset.@secret.toString();
            if (param1.photoset.@server.toString())
            {
                _loc_2.server = parseInt(param1.photoset.@server.toString());
            }
            for each (_loc_3 in param1.photoset.photo)
            {
                
                _loc_4 = new Photo();
                _loc_4.id = _loc_3.@id.toString();
                _loc_4.secret = _loc_3.@secret.toString();
                _loc_4.title = _loc_3.@title.toString();
                _loc_4.server = parseInt(_loc_3.@server);
                _loc_2.photos.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parsePhotoSetList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:PhotoSet = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.photosets.photoset)
            {
                
                _loc_4 = new PhotoSet();
                _loc_4.id = _loc_3.@id.toString();
                _loc_4.url = _loc_3.@url.toString();
                _loc_4.ownerId = _loc_3.@ownerid.toString();
                _loc_4.primaryPhotoId = _loc_3.@primary.toString();
                _loc_4.photoCount = parseInt(_loc_3.@photos.toString());
                _loc_4.secret = _loc_3.@secret.toString();
                _loc_4.server = parseInt(_loc_3.@server.toString());
                _loc_4.title = _loc_3.title.toString();
                _loc_4.description = _loc_3.description.toString();
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parseUserTags(param1:XML) : User
        {
            var _loc_3:XML = null;
            var _loc_4:PhotoTag = null;
            var _loc_2:* = new User();
            _loc_2.nsid = param1.who.@id.toString();
            for each (_loc_3 in param1.who.tags.tag)
            {
                
                _loc_4 = new PhotoTag();
                _loc_4.raw = _loc_3.toString();
                _loc_4.tag = _loc_3.toString();
                if (_loc_3.@count.toString())
                {
                    _loc_4.count = parseInt(_loc_3.@count);
                }
                _loc_2.tags.push(_loc_4);
            }
            return _loc_2;
        }// end function

        static function parseTagList(param1:XML) : Array
        {
            var _loc_3:XML = null;
            var _loc_4:PhotoTag = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in param1.tags.tag)
            {
                
                _loc_4 = new PhotoTag();
                _loc_4.raw = _loc_3.toString();
                _loc_4.tag = _loc_3.toString();
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

    }
}
