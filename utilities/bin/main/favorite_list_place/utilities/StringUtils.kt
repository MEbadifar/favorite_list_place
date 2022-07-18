/*
 * This Kotlin source file was generated by the Gradle 'init' task.
 */
package favorite_list_place.utilities

import favorite_list_place.list.LinkedList

class StringUtils {
    companion object {
        fun join(source: LinkedList): String {
            return JoinUtils.join(source)
        }

        fun split(source: String): LinkedList {
            return SplitUtils.split(source)
        }
    }
}