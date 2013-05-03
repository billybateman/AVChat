package com.adobe.webapis.flickr.events
{
    import com.adobe.webapis.events.*;

    public class FlickrResultEvent extends ServiceEvent
    {
        public var success:Boolean;
        public static const AUTH_CHECK_TOKEN:String = "authCheckToken";
        public static const AUTH_GET_FROB:String = "authGetFrob";
        public static const AUTH_GET_TOKEN:String = "authGetToken";
        public static const BLOGS_GET_LIST:String = "blogsGetList";
        public static const BLOGS_POST_PHOTO:String = "blogsPostPhoto";
        public static const CONTACTS_GET_LIST:String = "contactsGetList";
        public static const CONTACTS_GET_PUBLIC_LIST:String = "contactsGetPublicList";
        public static const FAVORITES_ADD:String = "favoritesAdd";
        public static const FAVORITES_GET_LIST:String = "favoritesGetList";
        public static const FAVORITES_GET_PUBLIC_LIST:String = "favoritesGetPublicList";
        public static const FAVORITES_REMOVE:String = "favoritesRemove";
        public static const GROUPS_BROWSE:String = "groupsBrowse";
        public static const GROUPS_GET_INFO:String = "groupsGetInfo";
        public static const GROUPS_SEARCH:String = "groupsSearch";
        public static const GROUPS_POOLS_ADD:String = "groupsPoolsAdd";
        public static const GROUPS_POOLS_GET_CONTEXT:String = "groupsPoolsGetContext";
        public static const GROUPS_POOLS_GET_GROUPS:String = "groupsPoolsGetGroups";
        public static const GROUPS_POOLS_GET_PHOTOS:String = "groupsPoolsGetPhotos";
        public static const GROUPS_POOLS_REMOVE:String = "groupsPoolsRemove";
        public static const INTERESTINGNESS_GET_LIST:String = "interestingnessGetList";
        public static const PEOPLE_FIND_BY_EMAIL:String = "peopleFindByEmail";
        public static const PEOPLE_FIND_BY_USERNAME:String = "peopleFindByUsername";
        public static const PEOPLE_GET_INFO:String = "peopleGetInfo";
        public static const PEOPLE_GET_PUBLIC_GROUPS:String = "peopleGetPublicGroups";
        public static const PEOPLE_GET_PUBLIC_PHOTOS:String = "peopleGetPublicPhotos";
        public static const PEOPLE_GET_UPLOAD_STATUS:String = "peopleGetUploadStatus";
        public static const PHOTOS_ADD_TAGS:String = "photosAddTags";
        public static const PHOTOS_GET_ALL_CONTEXTS:String = "photosGetAllContexts";
        public static const PHOTOS_GET_CONTACTS_PHOTOS:String = "photosGetContactsPhotos";
        public static const PHOTOS_GET_CONTACTS_PUBLIC_PHOTOS:String = "photosGetContactsPublicPhotos";
        public static const PHOTOS_GET_CONTEXT:String = "photosGetContext";
        public static const PHOTOS_GET_COUNTS:String = "photosGetCounts";
        public static const PHOTOS_GET_EXIF:String = "photosGetExif";
        public static const PHOTOS_GET_INFO:String = "photosGetInfo";
        public static const PHOTOS_GET_NOT_IN_SET:String = "photosGetNotInSet";
        public static const PHOTOS_GET_PERMS:String = "photosGetPerms";
        public static const PHOTOS_GET_RECENT:String = "photosGetRecent";
        public static const PHOTOS_GET_SIZES:String = "photosGetSizes";
        public static const PHOTOS_GET_UNTAGGED:String = "photosGetUntagged";
        public static const PHOTOS_REMOVE_TAG:String = "photosRemoveTag";
        public static const PHOTOS_SEARCH:String = "photosSearch";
        public static const PHOTOS_SET_DATES:String = "photosSetDates";
        public static const PHOTOS_SET_META:String = "photosSetMeta";
        public static const PHOTOS_SET_PERMS:String = "photosSetPerms";
        public static const PHOTOS_SET_TAGS:String = "photosSetTags";
        public static const PHOTOS_LICENSES_GET_INFO:String = "photosLicensesGetInfo";
        public static const PHOTOS_LICENSES_SET_LICENSE:String = "photosLicensesSetLicense";
        public static const PHOTOS_NOTES_ADD:String = "photosNotesAdd";
        public static const PHOTOS_NOTES_EDIT:String = "photosNotesEdit";
        public static const PHOTOS_NOTES_DELETE:String = "photosNotesDelete";
        public static const PHOTOS_TRANSFORM_ROTATE:String = "photosTransformRotate";
        public static const PHOTOS_UPLOAD_CHECK_TICKETS:String = "photosUploadCheckTickets";
        public static const PHOTOSETS_ADD_PHOTO:String = "photosetsAddPhoto";
        public static const PHOTOSETS_CREATE:String = "photosetsCreate";
        public static const PHOTOSETS_DELETE:String = "photosetsDelete";
        public static const PHOTOSETS_EDIT_META:String = "photosetsEditMeta";
        public static const PHOTOSETS_EDIT_PHOTOS:String = "photosetsEditPhotos";
        public static const PHOTOSETS_GET_CONTEXT:String = "photosetsGetContext";
        public static const PHOTOSETS_GET_INFO:String = "photosetsGetInfo";
        public static const PHOTOSETS_GET_LIST:String = "photosetsGetList";
        public static const PHOTOSETS_GET_PHOTOS:String = "photosetsGetPhotos";
        public static const PHOTOSETS_ORDER_SETS:String = "photosetsOrderSets";
        public static const PHOTOSETS_REMOVE_PHOTO:String = "photosetsRemovePhoto";
        public static const TAGS_GET_LIST_PHOTO:String = "tagsGetListPhoto";
        public static const TAGS_GET_LIST_USER:String = "tagsGetListUser";
        public static const TAGS_GET_LIST_USER_POPULAR:String = "tagsGetListUserPopular";
        public static const TAGS_GET_RELATED:String = "tagsGetRelated";
        public static const TEST_ECHO:String = "testEcho";
        public static const TEST_LOGIN:String = "testLogin";
        public static const URLS_GET_GROUP:String = "urlsGetGroup";
        public static const URLS_GET_USER_PHOTOS:String = "urlsGetUserPhotos";
        public static const URLS_GET_USER_PROFILE:String = "urlsGetUserProfile";
        public static const URLS_LOOKUP_GROUP:String = "urlsLookupGroup";
        public static const URLS_LOOKUP_USER:String = "urlsLookupUser";

        public function FlickrResultEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
        {
            super(param1, param2, param3);
            return;
        }// end function

    }
}
